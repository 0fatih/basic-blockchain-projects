// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                            Visibility

    Functions and state variables have to declare wherher they are 
    accessible by other contracts.
    
    Functions can be declared as:
        - public   : Any contracts and account can call.
        - private  : Only inside the contract that defines the function.
        - internal : Only inside contract that inherits an internal function.
        - external : Only other contracts and account calls.

    State variables can be declared as public, private or internal but not external.

*/

contract Base {
    
    // private function can only be called inside the contract
    // Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns(string memory) {
        return "Private function called";
    }
    
    function testPrivateFunc() public pure returns(string memory) {
        return privateFunc();
    }
    
    
    // Internal function can be called inside this contract, inside contracts that inherit this contract
    function internalFunc() internal pure returns(string memory) {
        return "Internal function called";
    }
    
    function testInternalFun() public pure virtual returns(string memory) {
        return internalFunc();
    }
    
    
    // Public functions can be called inside this contract, 
    // inside contracts that inherit this contract, by other contracts and accounts.
    function publicFunc() public pure returns(string memory) {
        return "Public function called";
    }
    
    
    // External functions can only be called by other contracts and accounts
    function externalFunc() external pure returns(string memory) {
        return "External function called";
    }
    
    
    // This function will not compile since we're trying to call an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }
    
    
    // State variables
    string private privateVar = "My private var";
    string internal internalVar = "My internal var";
    string public publicVar = "My public var";
    
    
    // State variables cannot be external so this code won't compile:
    // string external externalVar = "THIS WILL NOT WORK";
    
}


contract Child is Base {
    
    // Inherited contracts do not have access to private functions and state variables.
        
    
    // Internal function can be called inside child contracts 
    function testInternalFunc() public pure returns(string memory) {
        return internalFunc();
    }
    
}

