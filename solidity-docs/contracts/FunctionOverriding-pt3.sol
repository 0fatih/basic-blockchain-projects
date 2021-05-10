// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract A { function f() public pure {} }

contract B is A {}

contract C is A {}

// No explicit override required

contract D is B, C {}
