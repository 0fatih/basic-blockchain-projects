// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract InternalFunctionCalls {
    
    function g(uint a) public pure returns (uint ret) { return a + f(); } // We can access this function out of contract
    function f() internal pure returns (uint ret) { return g(7) + f(); } // But we can't access that one
    
}
