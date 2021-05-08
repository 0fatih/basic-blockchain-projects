// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
                            
                                            Functions
                            
    Functions can be defined inside or outside of contracts.
    
    Functions outside of a contract. also called "free functions", always have implicit `internal`
    visibility. Their code is included in all contracts that call them, similar to internal library functions.

*/

function sum(uint[] memory _arr) pure returns (uint s) {
    for (uint i = 0; i < _arr.length; i++)
        s += _arr[i];
}

contract ArrayExample {
    bool found;
    
    function f(uint[] memory _arr) public {
        // This calls the free function internally.
        uint s = sum(_arr);
        require(s >= 10);
        found = true;
    }
}

