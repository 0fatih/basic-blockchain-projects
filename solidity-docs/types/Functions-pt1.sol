// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract Functions {
    
    /* 
    
        There are two types of functions: internal and external
    
        function (<parameter types>) {internal|external} {pure|view|payable} [returns (<return types>)]
    
        By default, function types are internal, so the internal keyword can be omitted.
    
    
        Note that public functions of the current contract can be used both as an internal 
        and as an external function. To use f as an internal function, just use f, if you want 
        to use its external form, use this.f


        External (or public) functions have the following members:
        .address  : returns the address of the contract of the function.
        .selector : returns the ABI function selector.
        
    */
    
    function f() public payable returns (bytes4) {
        assert(this.f.address == address(this));
        return this.f.selector;
    }
    
    function g() public {
        this.f{gas: 10, value: 800}();
    }
    
}
