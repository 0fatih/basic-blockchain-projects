// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                            Error
    
    An error will undo all changes made to the state during a transaction.

    You can throw an error by calling `require`, `revert` or `assert`.

        require : Used to validate inputs and conditions before execution.
        
        revert  : Similar to `require`.
        
        assert  : Used to check for code that should never be false. Failing
        assertion probably means that there is a bug.
        
*/

contract Error {
    function testRequire(uint _i) public {
        // require should be used to validate conditions such as:
        // inputs, conditions before execution, return values from calls to other functions
        
        require(_i > 10, "input must be greater than 10.");
    }
    
    function testRever(uint _i) public {
        // revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above.
        if(_i <= 10) revert("input muse be greater than 10.");
    }
    
    uint public num;
    
    function testAssert() public {
        // Assert should only be used to test for internal errors, and to check invariants.
        
        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num 
        assert(num == 0);
    }
    
    
    
}
