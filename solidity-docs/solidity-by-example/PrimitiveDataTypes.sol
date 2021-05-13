// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract Primitives {
    
    /*
    
        uint stands for unsigned integer, meanining non negative integers
        different sizes are available
        
        uint8    ranges from 0 to 2 ** 8 - 1 
        uint16   ranges from 0 to 2 ** 16 -1
        ...
        uint256  ranges from 0 to 2 ** 256 - 1
    
    */
    
    uint8 u8 = 1;
    uint256 u16 = 434;
    uint u = 134; // uint is an alias for uint256
    
    /*
        Negative numbers are allowed for int types.
        Like uint, different ranges available from uint8 to uint256
    */
    
    int8 i8 = -1;
    int256 i256 = 564;
    int i = -234; // Int is same as int256
    
    address addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    
    // Unsigned variables have a default value
    bool defaultBoo; // false
    uint defaultUint; // 0 
    int defaultInt; // 0 
    address defaultAddr; // 0x0000000000000000000000000000000000000000

}
