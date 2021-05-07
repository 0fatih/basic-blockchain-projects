// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract OwnedToken {
    TokenCreator creator; // Defined below
    address owner;
    bytes32 name;
    
    constructor(bytes32 _name) {
        // We don't have to use "this" for state variables in Solidity.
        owner = msg.sender;
        
        // We perform an explicit type conversion from 'address' to 'TokenCreator'
        // and assume that the type of the calling contract is 'TokenCreator',
        // there is no real way to verify that.
        // This doesn't create a new contract.
        
        creator = TokenCreator(msg.sender);
        name = _name;
        
    }
    
    function changeName(bytes32 newName) public {
        // Only the creator can alter the name.
        if(msg.sender == address(creator))
            name = newName;
    }
    
    function transfer(address newOwner) public {
        // Only the current owner can transfer the token.
        if(msg.sender != owner) return;
        
        // We ask the creator contract if the transfer should proceed
        // by using a function of the 'TokenCreator' contract defined below.
        // If the call fails (e.g. due to out-of-gas), the execution also fails here.
        
        if(creator.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}

contract TokenCreator {
    
    function createToken(bytes32 name) public returns (OwnedToken tokenAddress) {
        // Create a new 'Token' contract and return its address.
        // From the JS side, the return type of this function is
        // 'address', as this is the closest type available in the ABI.
        
        return new OwnedToken(name);
    }
    
    function changeName(OwnedToken tokenAddress, bytes32 name) public {
        // Again, the external type of 'tokenAddress' is simply 'address'.
        tokenAddress.changeName(name);
    }
    
    // Perform checks to determine if transferring a token to the 'OwnedToken' 
    // contract should proceed.
    function isTokenTransferOK(address currentOwner, address newOwner) public pure returns (bool ok) {
        // Check an arbitrary condition to see if transfer should proceed.
        return keccak256(abi.encodePacked(currentOwner, newOwner))[0] == 0x7f;
    }
    
}
