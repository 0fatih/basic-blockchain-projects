// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*

                                Constructors
                                
    A constructor is an optional function declared with the `constructor` keyword
    which is executed upon contract creation, and where you can run contract 
    initialisation code.
    
    Before the constructor code is executed, state variables are initialised to 
    their specified value if you initialise them inline, or zero if you don't.
    
    After the constructor has run, the final code of the contract is deoployed to 
    the blockchain. The deployment of the code costs additional gas linear to the 
    length of the code. This code includes all functions that are part of the public
    interface and all functions that are reachable from there through function calls.
    It does not include the constructor code or internal functions that are only called 
    from the constructor.
    
    If there is no constructor, the contract will assume the default constructor, which 
    is equivalent to `constructor() {}`.

*/

abstract contract A {
    uint public a;
    
    constructor(uint _a) {
        a = _a;
    }
}

contract B is A(1) {
    constructor() {}
}

/*
    In this case, the contract has to be marked abstract, because these parameters cannot 
    be assigned valid values from outside but only through the constructors of derived contracts.
*/
