// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract Arrays {
    
    /*
                
                Array Slices
                
        Array slices are a view on a contiguous portion of an array. 
        They are written as x[start:end], where start and end are expressions 
        resulting in a uint256 type (or implicitly convertible to it). 
        The first element of the slice is x[start] and the last element is x[end - 1].
    
        If start is greater than end or if end is greater than the length of the array, 
        an exception is thrown.
        
        Both start and end are optional: start defaults to 0 and end defaults to the length of the array.
    
    */
    
    address client;
    
    constructor(address _client) {
        client = _client;
    }
    
    function forward(bytes calldata _payload) external {
        
        bytes4 sig = _payload[0] |
        (bytes4(_payload[1]) >> 8) |
        (bytes4(_payload[2]) >> 16) |
        (bytes4(_payload[3]) >> 24);
        
        if(sig == bytes4(keccak256("setOwner(address)"))) {
            address owner = abi.decode(_payload[4:], (address));
            require(owner != address(0), "Address of owner cannot be zero");
        }
        
        (bool status,) = client.delegatecall(_payload);
        require(status, "Forwarded call failed.");
        
    }
}
