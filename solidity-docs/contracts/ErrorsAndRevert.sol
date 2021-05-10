// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*

                                Errors and the Revert Statement
                                
    Errors in Solidity provide a convenient and gas-efficient way to explain to the user why an 
    operation failed. They can be defined inside and outside of contracts (including interfaces 
    and libraries).


    Errors cannot be overloaded or overridden but are inherited. The same error can be defined 
    in multiple places as long as the scopes are distinct. Instances of errors can only be created 
    using revert statements.


*/


error InsufficientBalance(uint256 available, uint256 required);

contract TestToken {
    mapping(address => uint) balance;
    function transfer(address to, uint256 amount) public {
        if(amount > balance[msg.sender])
            revert InsufficientBalance({
                available: balance[msg.sender],
                required: amount
            });
        
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
    
}
