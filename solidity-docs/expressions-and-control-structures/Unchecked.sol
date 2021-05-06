// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract C {
    
    string name = "Fatih";
    
    function safeWay(uint a, uint b) pure public returns(uint) {
        // This subtraction will wrap on underflow
        unchecked { return a - b; } 
    }
    
    function unsafeWay(uint a, uint b) pure public returns(uint) {
        // This subtraction will revert on underflow
        return a - b;
    }
    
}
