// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract Complex {
    
    struct Data {
        uint a;
        bytes3 b;
        mapping (uint => uint) map;
    }
    
    mapping (uint => mapping(bool => Data[])) public data;
    
}

/*
    It generates a function of the following form. The mapping in the struct is omitted
    because there is no good way to provide the key for the mapping:

    function data(uint arg1, bool arg2, uint arg3) public returns (uint a, bytes3 b) {
        a = data[arg1][arg2][arg3].a;
        b = data[arg1][arg2][arg3].b;
    }

*/

