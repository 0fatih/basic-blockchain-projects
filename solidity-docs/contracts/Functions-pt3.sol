// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*
                            
                                    Return Variables
                            
    Function return variables are declared with the same syntax after the `returns` keyword.
    
    For example, suppose you want to return two results: the sum and the product of two integers
    passed as function parameters, then you use something like:
    
*/

contract Simple {
    
    function arithmetic(uint _a, uint _b) public pure returns(uint o_sum, uint o_product) {
        o_sum = _a + _b;
        o_product = _a * _b;
    }
    
}

/*

    The names of return variables can be omitted. Return variables can be used as any other 
    local variable and they are initialized with their default value and have that value 
    until they are (re-)assigned.
    

    You can either explicitly assign to return variables and then leave the function as 
    above, or you can provide return values (either a single or multiple ones) directly 
    with the return statement:

            return (_a + _b, _a * _b);
            
    If you use an early return to leave a function that has return variables, you must 
    provide return values together with the return statement.



*/
