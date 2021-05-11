// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*

    One area where inheritance linearization is especially important and perhaps not as 
    clear is when there are multiple constructors in the inheritance hierarchy. 
    The constructors will always be executed in the linearized order, regardless of the 
    order in which their arguments are provided in the inheriting contract’s constructor. 
    For example:

*/

contract Base1 {
    constructor() {}
}

contract Base2 {
    constructor() {}
}

/*
    Constructors are executed in the following order:
    1 - Base1
    2 - Base2
    3 - Derived1
*/

contract Derived1 is Base1, Base2 {
    constructor() Base1() Base2() {}
}

/*
    Constructors are executed in the following order:
    1 - Base2
    2 - Base1
    3 - Derived2
*/

contract Derived2 is Base2, Base1 {
    constructor() Base2() Base1() {}
}

/*
    Constructors are executed in the following order:
    1 - Base2
    2 - Base1
    3 - Derived3
*/
contract Derived3 is Base2, Base1 {
    constructor() Base1() Base2() {}
}
