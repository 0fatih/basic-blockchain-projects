// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*
                            
                                    Functions Parameters
                            
    Function parameters are declared the same way as variables, and the name of unused
    parameters can be omitted. 
    
    For example, if you want your contract to accept one kind of
    external call with two integers you would use something like the following.
    
    
    NOTE: An external function cannot accept a multi-dimensional array as an input parameter.
    This functionality is possible if you enable the ABI coder v2 by adding `pragma abicoder v2;`
    to your source file. An internal function can accept a multi-dimensional array without enabling
    the feature.
    
*/

contract Simple {
    uint sum;
    function taker(uint _a, uint _b) public {
        sum = _a + _b;
    }
}
