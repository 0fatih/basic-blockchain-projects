// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
                            
                                    Interfaces
    
    Interfaces are similar to abstract contracts, but they cannot have any functions
    implemented. There are further restrictions:
    
        * They cannot inherit from other contracts, but they can inherit from other interfaces.
        * All declared functions must be external.
        * They cannot declare a constructor.
        * They cannot declare state variables.
        
    Interfaces are basically limited to what the Contract ABI can represent, and the conversion 
    between the ABI and an interface should be possible without any information loss.
*/

interface Token {
    enum TokenType { Fungible, NonFungible }
    struct Coin { string obverse; string reverse; }
    function transfer(address recipient, uint amount) external;
}
