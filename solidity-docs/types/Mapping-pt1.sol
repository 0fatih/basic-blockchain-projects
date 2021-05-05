// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingExample {
    
    /*
    
                    Mapping Types
                    
        Mapping types use the syntax: mapping(_KeyType => _ValueType) _VariableName
        
        The _KeyType can be any built-in type, bytes, string, pr any contract or enum type.
        Other user-defined or complex types, such as mappings, structs or array types are not allowed.
        _ValueType can be any type, including mappings, arrays and structs.
        
        You can mark state variables of mapping type as public and Solidity creates a getter for you. 
        The _KeyType becomes a parameter for the getter. If _ValueType is a value type or a struct, 
        the getter returns _ValueType. If _ValueType is an array or a mapping, 
        the getter has one parameter for each _KeyType, recursively.

    */
    
    mapping(address => uint) public balances;
    
    function update(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract MappingUser {
    function f() public returns (uint) {
        MappingExample m = new MappingExample();
        m.update(100);
        return m.balances(address(this));
    }
}
