// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract C {
    
    // The names of unused parameters (especially return parameters) can be omitted. Those parameters will still be present on the stack, but they are inaccessible.

    // NOTE: If you give a name to return variable, you don't have to user return in function.
    // Because, in Solidity the return variable will return automatically.
    function f(uint k, uint) public pure returns(uint) {
        return k;
    }
}
