// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                                Function Overloading
                                
    A contract can have multiple functions of the same name but with different parameter types. 
    This process is called “overloading” and also applies to inherited functions.

*/


contract A {
    
    function f(uint _in) public pure returns (uint out) {
        out = _in;
    }
    
    function f(uint _in, bool _really) public pure returns (uint out) {
        if(_really)
            out = _in;
    }
    
}
