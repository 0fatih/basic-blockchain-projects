// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*
                                
                                Abstract Contracts

    Contracts need to be marked as abstract when at least one of their functions is 
    not implemented. Contracts may be marked as abstract even though all functions
    are implemented.
    
    This can be done by using the abstract keyword as shown in the following example. 
    Note that this contract needs to be defined as abstract, because the function 
    utterance() was defined, but no implementation was provided (no implementation 
    body { } was given).:

*/

abstract contract C {
    function utterance() public virtual returns(bytes32);
}
