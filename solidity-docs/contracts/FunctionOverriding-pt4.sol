// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

    Public state variables can override external functions if the parameter and return 
    types of the function matches the getter function of the variable:

*/

contract A {
    function f() external view virtual returns(uint) { return 5; }
}

contract B is A {
    uint public override f;
}
