// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                            Variables
    
    There are 3 types of variables in Solidity 
    
    1) local:
        - Declared inside a function
        - Not stored on the blockchain

    2) state:
        - Declared outside a function
        - Stored on the blockchain
    
    3) global:
        - Provides information about the blockchain
*/

contract Variables {
    // State variables are stored on the blockchain
    string public text = "Hello";
    uint public num = 123;
    
    function doSomething() public view {
        // Local variables are not saved to the blockchain.
        uint i = 354;
        
        // Here are some global variables:
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // Address of the caller
        
    }

}
