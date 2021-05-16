// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// Allows deposits, withdrawals, and balance checks.

contract SimpleBank {
    
    // Map addresses to balances
    // private means that other contracts can't directly query balances
    // but data is still viewable to other parties on blockchain.
    mapping(address => uint) private balances;
    
    
    // `public` makes externally readable (not writable) by users or contracts
    address public owner;
    
    
    // Events - publicize actions to external listeners
    event LogDepositMade(address accountAddress, uint amount);
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    
    function deposit() public payable returns (uint) {
        // Use `require` to test user inputs, `assert` for internal invariants
        // Sure that there isn't an overflow issue
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);

        balances[msg.sender] += msg.value;
        
        emit LogDepositMade(msg.sender, msg.value); // fire event 
        
        return balances[msg.sender];
    }
    
    
    function withdraw(uint withdrawAmount) public returns(uint remainingBal) {
        require(withdrawAmount <= balances[msg.sender]);
        
        // Note the way we deduct the balance right away, before sending
        // Every .transfer/.send from this contract can call an external function
        // This may allow the caller to request an amount greater
        // than their balance using a recursive call
        // Aim to commit state before calling external functions, including .transfer/.send
        balances[msg.sender] -= withdrawAmount;
        
        // this automatically throws on a failure, which means the updated balance is reverted
        (bool sent, ) = msg.sender.call{value: withdrawAmount}("");
        require(sent, "failure to send ether");
        return balances[msg.sender];
    }
    
    
    function balance() view public returns (uint) {
        return balances[msg.sender];
    }
}
