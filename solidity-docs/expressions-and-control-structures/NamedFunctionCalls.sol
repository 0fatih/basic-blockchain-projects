// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract C {
    
    
    /*
            
                Named Calls and Anonymous Function Parameters
    
        Function call arguments can be given by name, in any order, if they are enclosed in { } as can be seen in the following example. 
        The argument list has to coincide by name with the list of parameters from the function declaration, but can be in arbitrary order.

        
    */
    
    
    mapping(uint => uint) data;
    
    function f() public {
        set({ value: 2, key: 3});
    }
    
    function set(uint key, uint value) public {
        data[key] = value;
    }
    
}
