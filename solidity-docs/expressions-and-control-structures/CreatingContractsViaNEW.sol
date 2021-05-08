// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract D {
    uint public x;
    
    constructor(uint a) payable {
        x = a;
    }
}

contract C {
    D d = new D(4); // 4 will be executed as part of constructor of D
    
    function createD(uint arg) public {
        D newD = new D(arg);
        newD.x();
    }
    
    function createAndEndowD(uint arg, uint amount) public payable {
        // Send ether along with the creation
        D newD = new D{value: amount}(arg);
        newD.x();
    }
    
    /*
        As seen in the example, it is possible to send Ether while creating an instance of D using 
        the value option, but it is not possible to limit the amount of gas. If the creation fails 
        (due to out-of-stack, not enough balance or other problems), an exception is thrown.


    
}
