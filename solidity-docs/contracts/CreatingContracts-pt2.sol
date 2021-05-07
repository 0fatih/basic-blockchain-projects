// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract V {
    /* 
    
                        Visibility and Getters
                        
        Solidity knows two kinds of function calls; internal ones that do not create an actual
        EVM call (also called a "message call") and external ones that do. Because of that,
        there are four types of visibility for functions and state variables.
        
        functions have to be specified as being external, public, internal or private.
        For state variables, external is not possible.
        
        
        
            external : External functions are part of the contract interface, which means
            they can be called from other contracts and via transactions. An external function
            f cannot be called internally (i.e. f() does not work, but this.f() works.)
            
            public : Public functions are part of the contract interface and can be either called
            internally or via messages. For public state variables, an automatic getter function (see below)
            is generated.
            
            internal : Those functions and state variables can only be accessed internally (i.e. from 
            within the current contract or contracts deriving from it), without using this. This is the default visibility
            level for state variables.
            
            private : Private functions and state variables are only visible for the contract 
            they are defined in and not in derived contracts.
            
            
        Note: Everything that is inside a contract is visible to all observers external to 
        the blockchain. Making something private only prevents other contracts from reading 
        or modifying the information, but it will still be visible to the whole world 
        outside of the blockchain.
        
        
        The visibility specifier is given after the type for state variables 
        and between parameter list and return parameter list for functions.
        
    */
    
    function f(uint a) private pure returns (uint b) { return a + 1; }
    function setData(uint a) internal { data=a; }
    uint public data;
}
