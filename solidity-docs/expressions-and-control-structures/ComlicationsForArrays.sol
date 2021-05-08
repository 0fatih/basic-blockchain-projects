// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract C {
    uint[20] x;
    
    function f() public {
        g(x);
        h(x);
    }
    
    /* 
    
        In the example below the call to g(x) has no effect on x because it creates an 
        independent copy of the storage value in memory. However, h(x) successfully 
        modifies x because only a reference and not a copy is passed.

    */
    
    function g(uint[20] memory y) internal pure {
        y[2] = 3;
    }
    
    function h(uint[20] storage y) internal {
        y[3] = 4;
    }
}
