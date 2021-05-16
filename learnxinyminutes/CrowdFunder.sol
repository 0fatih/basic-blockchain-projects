// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// A crowdfunding example (broadly similar to Kickstarter)

contract CrowdFunder {
    address public creator;
    address payable public fundRecipient;
    uint public minumumToRaise;
    string campaignUrl;
    bytes version = "1";
    
    enum State {
        Fundraising,
        ExpiredRefund,
        Successful
    }
    
    struct Contribution {
        uint amount;
        address payable contributor;
    }
    
    State public state = State.Fundraising;
    uint public totalRaised;
    uint public raiseBy;
    uint public completeAt;
    Contribution[] contributions;
    
    event LogFundingReceived(address addr, uint amount, uint currentTotal);
    event LogWinnerPaid(address winnerAddress);
    
    modifier inState(State _state) {
        require(state == _state);
        _;
    }
    
    modifier isCreator() {
        require(msg.sender == creator);
        _;
    }
    
    // Wait 24 weeks after final contract state before allowing contract destruction
    modifier atEndOfLifecycle() {
        require(((state == State.ExpiredRefund || state == State.Successful) && completeAt + 24 weeks < block.timestamp));
        _;
    }
    
    function crowdFund(
        uint timeInHoursForFundraising,
        string memory _campaignurl,
        address payable _fundReceipient,
        uint _minimumToRaise) public {
            creator = msg.sender;
            fundRecipient = _fundReceipient;
            campaignUrl = _campaignurl;
            minumumToRaise = _minimumToRaise;
            raiseBy = block.timestamp + (timeInHoursForFundraising * 1 hours);
        }
        
    function contribute() public payable inState(State.Fundraising) returns(uint256 id) {
        contributions.push(
            Contribution({
                amount: msg.value,
                contributor: payable(msg.sender)
            }));
            
        totalRaised += msg.value;
        
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        
        checkIfFundingCompleteOrExpired();
        return contributions.length - 1;
    }
    
    function checkIfFundingCompleteOrExpired() public {
        if(totalRaised > minumumToRaise) {
            state = State.Successful;
            payOut();
        } else if(block.timestamp > raiseBy) {
            state = State.ExpiredRefund;
        }
        
        completeAt = block.timestamp;
    }
    
    function payOut() public inState(State.Successful) {
        (bool sent, ) = fundRecipient.call{value: address(this).balance}("");
        require(sent, "failed to send ether");
        emit LogWinnerPaid(fundRecipient);
    }
    
    function getRefund(uint id) inState(State.ExpiredRefund) public returns(bool) {
        require(contributions.length < id && id >= 0 && contributions[id].amount != 0);
        uint amountToRefund = contributions[id].amount;
        contributions[id].amount = 0;
        contributions[id].contributor.transfer(amountToRefund);
        return true;
    }
    
    function removeContract() public isCreator() atEndOfLifecycle() {
        selfdestruct(payable(msg.sender));
        // creator gets all money that hasn't be claimed
    }
}
