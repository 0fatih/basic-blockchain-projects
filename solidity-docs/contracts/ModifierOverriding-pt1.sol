// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
                    Modifier Overriding
    
    function modifiers can override each other. This works in the same way as function 
    overriding (except that there is no overloading for modifiers). The `virtual` keyword
    must be used on the overriden modifier and the `override` keyword must be used in the 
    overriding modifier:

*/

contract Base {
    modifier foo() virtual {_;}
}

contract Inherited is Base {
    modifier foo() override {_;}
}
