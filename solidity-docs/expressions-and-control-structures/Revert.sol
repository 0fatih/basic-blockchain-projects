// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract C {
    
    /*
    
        A direct revert can be triggered using the revert statement and the revert function.
        The revert statement takes a custom error as direct argument without parentheses.
            
            revert CustomError(arg1, arg2);
            
        For backards-compability reasons, there is also the revert() funtion, which uses parentheses
        and accepts a string:
        
            revert();   revert("description");
            

        Using a custom error instance will usually be much cheaper 
        than a string description, because you can use the name of 
        the error to describe it, which is encoded in only four bytes. 
        A longer description can be supplied via NatSpec which does not incur any costs.
    
    */
    
    address owner;
    error Unauthorized();
    
    function buy(uint amount) public payable {
        if(amount > msg.value / 2 ether)
            revert("Not enough Ether provided.");
            
        // Alternative way to do it
        require(amount <= msg.value / 2 ether, "Not enough Ether provided.");
        
        // Perform the purchase.
    }
    
    function withdraw() public {
        if(msg.sender != owner)
            revert Unauthorized();
            
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
}
