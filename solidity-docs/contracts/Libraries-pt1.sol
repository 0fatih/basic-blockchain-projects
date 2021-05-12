// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

                            Libraries
                            
    Libraries are similar to contracts, but their purpose is that they are deployed 
    only once at a specific address and their code is reused using the DELEGATECALL 
    (CALLCODE until Homestead) feature of the EVM. This means that if library 
    functions are called, their code is executed in the context of the calling 
    contract, i.e. this points to the calling contract, and especially the storage 
    from the calling contract can be accessed. As a library is an isolated piece of 
    source code, it can only access state variables of the calling contract if they 
    are explicitly supplied (it would have no way to name them, otherwise). Library 
    functions can only be called directly (i.e. without the use of DELEGATECALL) if 
    they do not modify the state (i.e. if they are view or pure functions), because 
    libraries are assumed to be stateless. In particular, it is not possible to 
    destroy a library.

*/

struct Data {
    mapping(uint => bool) flags;
}

library Set {
    // Note that the first parameter is of type "storage
    // reference" and thus only its storage address and not
    // its contents is passed as part of the call.  This is a
    // special feature of library functions.  It is idiomatic
    // to call the first parameter `self`, if the function can
    // be seen as a method of that object.
    
    function insert(Data storage self, uint value) public returns (bool) {
        if(self.flags[value])
            return false;
        self.flags[value] = true;
        return true;
    }
    
    function remove(Data storage self, uint value) public returns (bool) {
        if(!self.flags[value])
            return false;
        self.flags[value] = false;
        return true;
    }
    
    function contains(Data storage self, uint value) public view returns(bool) {
        return self.flags[value];
    }
}

contract C {
    Data knownValues;
    
    function register(uint value) public {
        // The library functions can be called without a
        // specific instance of the library, since the
        // "instance" will be the current contract.
        
        require(Set.insert(knownValues, value));
    }
}
