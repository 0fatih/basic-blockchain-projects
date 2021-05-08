// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


contract A {
    
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }
    
    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
    
}

/*

    Calling f(50) would create a type error since 50 can be 
    implicitly converted both to uint8 and uint256 types. On 
    another hand f(256) would resolve to f(uint256) overload 
    as 256 cannot be implicitly converted to uint8.

*/
