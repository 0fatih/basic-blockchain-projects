// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*
                                
    Such abstract contracts can not be instantiated directly. This is also true, if an 
    abstract contract itself does implement all defined functions. The usage of an abstract 
    contract as a base class is shown in the following example:

*/

abstract contract C {
    function utterance() public virtual returns(bytes32);
}

contract D is C {
    function utterance() public pure override returns(bytes32) { return "miaow"; }
}

/*
    If a contract inherits from an abstract contract and does not implement all non-implemented 
    functions by overriding, it needs to be marked as abstract as well.

*/
