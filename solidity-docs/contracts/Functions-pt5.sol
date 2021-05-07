// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                            Pure Functions
                            
    Functions can be declared `pure` in which case they promise not to read from or modify the state.
    
    In addition to the list of state modifying statements explained above, the following are considered
    reading from the state:
        
        1) Reading from state variables.
        2) Accessing `address(this).balance` or `<address>.balance`.
        3) Accessing any of the memebers of `block`, `tx`, `msg`(with the exception of msg.sig and msg.data).
        4) Calling any function not marked `pure`.
        5) Using inline assembly that contains certain opcodes.
*/

contract C {
     
     function f(uint a, uint b) public pure returns (uint) {
         return a * (b + 42);
     }
}

/*
    
    Pure functions are able to use the revert() and require() functions to revert potentiak state changes when an error occurs.
    
    Reverting a state change is not considered a 'state modification', as only changes to the state made previously
    in code that did not have the `view` or `pure` restriction are reverted and that code has the option to catch the 
    revert and not pass it on.
    
    This behaviour is also in line with the `STATICCAL` opcode.

*/
