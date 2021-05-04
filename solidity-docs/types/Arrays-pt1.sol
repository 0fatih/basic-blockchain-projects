// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract Arrays {
    
    /*
    
                    bytes and string as Arrays
    
        Variables of type bytes and string are special arrays. A bytes is similar to byte[], but it is packed
        tightly in calldata and memory. string is equal to bytes but does not allow length or index access.
        
        Solidity does not have string manipulation functions, but there are third-party string libraries. You can also compare
        two strings by their keccak256-hash using
    */
    
    string string1 = "Fatih";
    string string2 = "Fatih";
    
    bytes string3 = "Block";
    bytes string4 = "chain";
    
    function compareStrings() public view returns(string memory){
        // Compare strings
        bool isEqual =  (keccak256(abi.encodePacked(string1)) == keccak256(abi.encodePacked(string2)));
        if(!isEqual)
            return "Those strings are not equal!";
        else
            return "Those strings are equal!";
        
    }
    
    function concatStrings() public view returns(string memory){
        string memory s = string(bytes.concat(string3, string4));
        return s;
    }
    
    
    
    /* 
    
                    Allocating Memory Arrays 
                    
        Memory arrays with dynamic length can be created using the new operator. 
        As opposed to storage arrays, it is not possible to resize memory arrays 
        (e.g. the .push member functions are not available). 
        You either have to calculate the required size in advance or create a new memory array and copy every element.

    */
    
    function allocate(uint len) public pure {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        assert(a.length == 7);
        assert(b.length == len);
        a[6] = 8;
    }
    
    function arrayLiterals() public pure returns(uint8[3] memory) {
        uint8[3] memory arr = [1,2,3];
        return arr;
    }
    
    function arrayLiterals2() public pure returns(uint24[2][4] memory) {
        uint24[2][4] memory x = [[uint24(0x1), 1], [0xffffff,2], [uint24(0xff), 3], [uint24(0xffff), 4]];
        return x;
    }
    
    // If you want to initialize dynamically-sized arrays, you have to assign the individual elements:

    function dynamicallySizedArray() public pure returns(uint[] memory){
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 2;
        x[2] = 4;
        return x;
    }
    
 
}
