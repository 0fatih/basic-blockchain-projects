// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract C {
    uint index;
    
    function f() public pure returns (uint, bool, uint) {
        return (7, true, 2);
    }
    
    function g() public {
        // Variables can declare with the return tuple.
        // Not all elements have to be specified BUT THE NUMBER MUST MACTH
        
        (uint x, ,uint y) = f();
        
        // Common trick to swap values -- does not work for non-value storage types.
        (x, y) = (y, x);
        
        // Components can be left out (also for variable declarations)
        (index, , ) = f();
    }
}
