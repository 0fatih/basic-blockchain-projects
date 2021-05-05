// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;


// Declaring a struct outside of a contract allows it to be shared
// by multiple contracts

struct Funder {
    address addr;
    uint amount;
}

contract CrowdFunding {
    
    // Struct can also be defined inside contracs, which makes them
    // visible only there and in derived contracts
    
    struct Campaign {
        address payable beneficiary;
        uint fundingGoal;
        uint numFunders;
        uint amount;
        mapping(uint => Funder) funders;
    }
    
    uint numCampaigns;
    mapping(uint => Campaign) campaigns;
    
    function newCampaign(address payable beneficiary, uint goal) public returns (uint campaignID) {
        campaignID = numCampaigns++;
        Campaign storage c = campaigns[campaignID];
        c.beneficiary = beneficiary;
        c.fundingGoal = goal;
    }
    
    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        c.funders[c.numFunders++] = Funder({ addr: msg.sender, amount: msg.value });
        c.amount += msg.value;
    }
    
    function checkGoalReached(uint campaignID) public returns(bool reached) {
        Campaign storage c = campaigns[campaignID];
        if(c.amount < c.fundingGoal)
            return false;
        uint amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);
        return true;
    }
    
}
