// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract C {
    
    // This will report a warning
    function declare() pure public returns(uint) {
        
        uint x = 1;
        
        {
            x = 2; // this will assign to the outer variable
            uint x;
        }
        
        return x; // x has value 2
        
    }
    
}
