// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*
                            Function Modifiers

    Modifiers can be used to change the behaivour of functions in a declarative way.
    For example, you can use a modifier to automatically check a condition prior to
    executing the funciton.
    
    Modifiers are inheritable properties of contracts and may be overridden by derived contracts,
    but only if they are marked `virtual`. 

*/

contract owned {
    constructor() { owner = payable(msg.sender); }
    address payable owner;
    
    /*
        This contract only defines a modifier but does not use it: It will be used
        in derived contracts. 
        
        The function body is inserted where the special symbol `_;` in the definition of a modifier appears.
        
        This means that if the owner calls this function, the function is executed and 
        otherwise, an exception is thrown.
    */
    
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
}

contract destructible is owned {
    /*
        This contract inherits the `onlyOwner` modifier from `owned` and
        applies it to the `destroy` function, which causes that calls to 
        `destroy` only have an effect if they are made by the stored owner.
    */
    
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}    

contract priced {
        // Modifiers can receive arguments:
        modifier costs(uint price) {
            if(msg.value >= price)
                _;
        }
}

contract Register is priced, destructible {
    mapping (address => bool) registeredAddresses;
    uint price;
    
    constructor(uint initialPrice) { price = initialPrice; }
    
    // It is important to also provide the `payable` keyword here,
    // otherwise the function will automatically reject all Ether to it.
    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }
    
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}

contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked, "Reentrant call.");
        locked = true;
        _;
        locked = false;
    }
    
    /*
        This function is protected by a mutex, which means that reentrant calls from
        within `msg.sender.call` cannot call `f` again. The `return 7` statement assigns
        7 to the return value but still executes the statement `locked = false` in the modifier.
    */
    function f() public noReentrancy returns (uint) {
        (bool success, ) = msg.sender.call("");
        require(success);
        return 7;
    }
}
