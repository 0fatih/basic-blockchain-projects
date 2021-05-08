// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract Types {
    
    // In solidity there is no "null" or "undefined" values. But newly declared variables always
    // have a default value dependent on its type.
    
    
    /* 
    
                    BOOLEAN 
        
        The default value for bool is: false
        Operators: !   &&   ||   ==   !=
    
    */
    bool thisIsBoolean;
    
    
    /* 
    
                    INTEGERS
    
        The default value for the uint or int is: 0 
        Keywords uint8 uint8 to int256 and int8 and int256.
        
        ** NOTE **: uint and int are aliases for uint256 and int256.
        
        Operators            : <=   <   ==  != >=   >
        Bit Operators        : &    |   ^   ~
        Shift Operators      : <<   >>
        Arithmetic Operators : +    -   *   /   %   **
    
        NOTE: For an integer type x, you can use type(X).min and type(X).max to access the minimum and maximum value representable by the type 
        
    */
    int thisIsINT;
    uint thiIsUINT;
    
    
    /*
    
                    ADDRESS 
        
        address: Holds a 20 byte value (size of an Ethereum address).
        address payable: Same as address, but with the additional members transfer and send.
        
        address can convert to address payable with: payable(<address>).
        
        Operators: <=   <   ==  !=  >=  >       // They can use for members like .balance
        
        Members: 
            <address>.balance(uint256)                          => balance of the address in wei
            <address>.code(bytes memory)                        => code at the address (can be empty)
            <address>.codehash(bytes32)                         => the codehash of the address
            <address payable>.transfer(uint256 amount)          => send given amount of Wei to address, reverts on failure, forwards 2300 gas stipend, not adjustbale
            <address payable>.send(uint256) returns (bool)      => send given amount of wei to address, returns false on failure, forwards 2300 gas stioend, not adjustable 
            <address>.call(bytes memory) returns(bool, bytes memory)            => issue low-level CALL with the given payload, returns success condition and return data, forwards all available gas, adjustable
            <address>.delegatecall(bytes memory) returns(bool, bytes memory)    => issue low-level DELEGATECALL with the given payload, returns success condition and return data, forwards all available gas, adjustable
            <address>.staticcall(bytes memory) returns (bool, bytes memory)     => issue low-level STATICCALL with the given payload, returns success condition and return data, forwards all available gas, adjustable
            

    */
    address thisIsAddress;
    address payable thiIsPayableAddress;
    
    
    /*
    
                    Fixed-size byte arrays
        
        The value types bytes1, bytes2, ...., bytes32 hold a sequence of bytes from one to up 32.
        For fixed-size arrays and bytes1 to bytes32, each individual element will be initialized to the default value corresponding to its type
        
        Operators:
            Comparisons         : <=    <   ==  !=  >=  >
            Bit Operators       : &     |   ^   ~
            Shift Operators     : <<    >>
            Index access        : if x is of type bytesI, then x[k] for 0 <= k < I returns the k the byte (read-only)
            
        Members:
            .length : yields the fixed length of the byte array(read only)
            
    */
    
    
    /*
    
                    Dynamically-sized byte array
    
        bytes, Dynamically-sized byte array.
        string, Dynamically-sized UTF-8-encoded string.
        
    
    
    
    */
    
    
    
}
