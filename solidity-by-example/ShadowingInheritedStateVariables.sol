// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;


/*

                        Shadowing Inherited State Variables
    
    Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.
    
    Let's learn how to correctly override inherited state variables.

*/

contract A {
    string public name = "Contract A";
    
    function getName() public view returns(string memory) {
        return name;
    }
}

contract B is A {
    constructor() {
        name = "Contract B";
    }
}

// B.getName returns "Contract B"
