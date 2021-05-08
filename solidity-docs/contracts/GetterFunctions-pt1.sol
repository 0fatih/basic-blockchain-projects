// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


    /*
    
                            Getter
        
        The compiler automatically creates getter functions for all public state variables.
        For the contract given below, the compiler will generate a function called `data`
        that does not take any arguments and returns a `uint`, the value of the state variable `data`.
        State variables can be initialized when they are declared.
    
    */
    

contract C {
    
    uint public data = 42;
}

contract Caller {
    C c = new C();
    function f() public view returns (uint) {
        return c.data();
    }
}
