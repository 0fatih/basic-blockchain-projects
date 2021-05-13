// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*
    
                        Using For 
                        
    The directive using A for B; can be used to attach library functions (from the library A) to 
    any type (B) in the context of a contract. These functions will receive the object they are 
    called on as their first parameter (like the self variable in Python).

    The effect of using A for *; is that the functions from the library A are attached to any type.

    In both situations, all functions in the library are attached, even those where the type 
    of the first parameter does not match the type of the object. The type is checked at the 
    point the function is called and function overload resolution is performed.

    The using A for B; directive is active only within the current contract, including within 
    all of its functions, and has no effect outside of the contract in which it is used. The 
    directive may only be used inside a contract, not inside any of its functions.

    Let us rewrite the set example from the Libraries in this way:


*/

struct Data { mapping(uint => bool) flags; }

library Set {
    
    function insert(Data storage self, uint value) public returns(bool) {
        
        if(self.flags[value]) return false;
        self.flags[value] = true;
        return true;
    }
    
    function remove(Data storage self, uint value) public returns(bool) {
        
        if(!self.flags[value]) return false;
        self.flags[value] = false;
        return true;
    }
    
    function contains(Data storage self, uint value) public view returns(bool) {
        
        return self.flags[value];
    }
}

contract C {
    
    using Set for Data;
    Data knownValues;
    
    function register(uint value) public {
        // Here, all variables of type Data have corresponding member functions.
        // The following function call is identical to `Set.insert(knownValues, value)`
        require(knownValues.insert(value));
    }
    
    
}
