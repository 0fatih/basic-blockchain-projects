// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


/*

                Multiple Inheritance and Linearization

    Languages that allow multiple inheritance have to deal with several problems. 
    One is the Diamond Problem. Solidity is similar to Python in that it uses 
    “C3 Linearization” to force a specific order in the directed acyclic graph 
    (DAG) of base classes. This results in the desirable property of monotonicity 
    but disallows some inheritance graphs. Especially, the order in which the base 
    classes are given in the is directive is important: You have to list the direct 
    base contracts in the order from “most base-like” to “most derived”. Note that 
    this order is the reverse of the one used in Python.

*/

// In the following code, Solidity will give the error "Linearization of inheritance graph impossible".

contract X {}
contract A is X {}
// This will not compile
contract C is A, X {}

/*
    The reason for this is that C requests X to override A (by specifying A, X in this order),
    but A itself requests to override X, which is a contradiction that cannot be resolved.
*/
