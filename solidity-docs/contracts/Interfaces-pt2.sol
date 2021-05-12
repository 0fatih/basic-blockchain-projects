// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
    
    Contracts can inherit interfaces as they would inherit other contracts.
    
    All functions declared in interfaces are implicitly virtual, which means 
    that they can be overridden. This does not automatically mean that an
    overriding function can be overridden again - this is only possible if 
    the overriding function is marked virtual.

*/

interface ParentA {
    function test() external returns(uint256);
}

interface ParentB {
    function test() external returns(uint256);
}

interface SubInterface is ParentA, ParentB {
    // Must redefine test in order to assert that the parent meanings are compatible.
    function test() external override(ParentA, ParentB) returns(uint256);
}
