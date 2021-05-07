// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                            View Functions
                            
    Functions can be declared view in which case they promise not to modify the state.

    The following statements are considered modifying the state:

        1) Writing to state variables.
        2) Emitting events.
        3) Creating other contracts.
        4) Using `selfdestruct`.
        5) Sending Ether via calls.
        6) Calling any function not marked `view` or `pure`.
        7) Using low-level calls.
        8) Using inline assembly that contains certain opcodes.
*/

contract C {
     
     function f(uint a, uint b) public view returns (uint) {
         return a * (b + 42) + block.timestamp;
     }
}
