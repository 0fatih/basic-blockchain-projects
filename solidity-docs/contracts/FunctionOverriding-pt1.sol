// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
    
                                Function Overriding
                                
    Base functions can be overriden by inheriting contracts to change their behavior if they
    are marked as `virtual`. The overriding function must then use the `override` keyword in 
    the function header. The overriding function may only change the visibility of the 
    overridden from `external` to public. The mutability may be changed to a more strict
    one following the order: `nonpayable` can be overridden by `view` and `pure`. `payable` is an
    exception and cannot be changed to any other mutability.

*/

contract Base {
    function foo() virtual external view {}
}

contract Middle is Base {}

contract Inherited is Middle {
    function foo() override public pure {}
}
