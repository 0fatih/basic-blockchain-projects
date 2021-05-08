// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

                                Function Overloading
                                
    Overloaded functions are also present in the external interface. It is an error if 
    two externally visible functions differ by their Solidity types but not by their external types.



*/


// This will not compile
contract A {
    
    function f(B _in) public pure returns (B out) {
        out = _in;
    }
    
    function f(address _in) public pure returns (address out) {
        out = _in;
    }
    
}

contract B {
    
}
