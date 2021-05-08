// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


    /*
    
                            Getter
        
        The getter functions have external visibility. If the symbol is accessed internally (i.e.
        without `this`), it evaluates to a state variable. If it is accessed externally (i.e.. with `this`)
        it evaluates to a function.
    
    */
    

contract C {
    uint public data;
    
    function x() public returns (uint) {
        data = 3; // internal access 
        return this.data(); // external access
    }
}
