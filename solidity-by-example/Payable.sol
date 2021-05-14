// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                                Payable 

    Functions and addresses declared `payable` can receive ether into the contract.
  
*/


contract Payable {
    
    // Payable address can receive ether
    address payable public owner;
    
    // Payable constructor can receive ether
    constructor() payable {
        owner = payable(msg.sender);
    }
    
    
    // Function to deposit ether into this contract.
    // Call this function with some ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable {
    }
    
    
    // Call this function alon with some ether.
    // The function will throw an error since this function is not payable.
    function notPayable() public {
    }
    
    
    // Function to withdraw all ether from this contract.
    function withdraw() public {
        // Get the amount of ether stored in this contract
        uint amount = address(this).balance;
        
        // Send all ether to owner
        // Owner can receive ether since the address of owner is payable 
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send ether"); 
    }
    
    
    // Function to transfer ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that `_to` is declared as payable 
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send ether");
    }
}
