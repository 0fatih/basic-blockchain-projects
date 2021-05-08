// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

                        Constant and Immutable State Variables
    
    State variables can be declared as constant or immutable. In both cases, the variables cannot be modified after
    the cotract has been constructed. For constant variables, the value has to be fixed at compile-time, while for 
    immutable, it can still be assigned at construction time.
    
    The compiler does not reserve a storage slot for these variables, and every occurence is replaced by the respective
    value.
    
    Compared to regular state variables, the gas costs of constant and immutable variables are much lower.
    
    For a constant variable, the expression assigned to it is copied to all the places where it is accessed and also
    re-evaluated each time. This allows for local optimizations. Immutable variables are evaluated each time. This allows
    for local optimizations. Immutable variables are evaluated once at construction time and their value is copied to all the
    places in the code where they are accessed. For these values, 32 bytes are reserved, even if they would fit in fewer bytes.
    Due to this, constant values can sometimes be cheaper than immutable values.
    
    
    
    

*/

uint constant X = 32**22 + 8;

contract C {
    string constant TEXT = 'abc';
    bytes32 constant MY_HASH = keccak256('abc');
    uint immutable decimals;
    uint immutable maxBalance;
    address immutable owner = msg.sender;
    
    constructor(uint _decimals, address _reference) {
        decimals = _decimals;
        
        maxBalance = _reference.balance;
    }
    
    function isBalanceTooHigh(address _other) public view returns (bool) {
        return _other.balance > maxBalance;
    }
}

/*

                                    Constant 
                            
    For constant variables, the value has to be a constant at compile time and it 
    has to be assigned where the variable is declared. Any expression that accesses 
    storage, blockchain data (e.g. block.timestamp, address(this).balance or block.number) 
    or execution data (msg.value or gasleft()) or makes calls to external contracts is 
    disallowed. Expressions that might have a side-effect on memory allocation are 
    allowed, but those that might have a side-effect on other memory objects are not. 
    The built-in functions keccak256, sha256, ripemd160, ecrecover, addmod and mulmod 
    are allowed (even though, with the exception of keccak256, they do call external contracts).



                                    Immutable
    
    Variables declared as immutable are a bit less restricted than those declared as constant: 
    Immutable variables can be assigned an arbitrary value in the constructor of the contract 
    or at the point of their declaration. They cannot be read during construction time and can 
    only be assigned once.

    The contract creation code generated by the compiler will modify the contract’s runtime 
    code before it is returned by replacing all references to immutables by the values assigned 
    to the them. This is important if you are comparing the runtime code generated by the compiler 
    with the one actually stored in the blockchain.


*/
