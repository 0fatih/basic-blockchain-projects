// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

                                Receive Ether Function
                                
    A contract can have at most one receive function, declared using `receive() external payable { ... }`
    (withoit the `function` keyword). This function cannot have arguments, cannot return anything and must
    have `external` visibility and payable state mutability. It can be virtual, can override and can have modifiers.
    
    The receive function is executed on a call to the contract with empty calldata. This is the function that is executed
    on plaint Ether transfers (e.g. via `.send()` or `.transfer()` ). If no such function exists, but a payable fallback
    function exists, the fallback function will be called on a plain Ether transfer. If neither a receive Ether nor a
    payable fallback function is present, the contract cannot receive Ether through regular transactions and throws an 
    exception.
    
    In the worst case, the receive function can only rely on 2300 gas being available (for example when send or transfer 
    is used), leaving little room to perform other operations except basic logging. The following operations will consume 
    more gas than the 2300 gas stipend:
            
            Writing to storage
            Creating a contract
            Calling an external function which consumes a large amount of gas
            Sending Ether


*/


// This contract keeps all Ether sent to it with no way to get it back.
contract Sink {
     
     event Received(address, uint);
     receive() external payable {
         emit Received(msg.sender, msg.value);
     }
     
}

