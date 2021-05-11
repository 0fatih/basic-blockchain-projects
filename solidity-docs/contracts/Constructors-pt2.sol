// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*

    The constructors of all the base contracts will be called following the 
    linearization rules explained below. If the base constructors have arguments, 
    derived contracts need to specify all of them. This can be done in two ways:

*/

contract Base {
    uint x;
    constructor(uint _x) { x = _x; }
}

// Either directly specify in the inheritance list 
constructor Derived1 is Base(7) {
    constructor() {}
}

// or through a `modifier` of the derived constructor.
contract Derived2 is Base {
    constructor(uint _y) Base(_y * _y) {}
}
