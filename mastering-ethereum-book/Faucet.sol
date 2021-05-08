// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract Faucet {
    
    receive() external payable {}
    
    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 100000000000000000);
        
        /*
            The original code is:
                msg.sender.transfer(withdraw_amount);
            
            But it gives me an address payable error. I am in learning process and i found this solution for now.
            It works.
        
        */
        payable(msg.sender).transfer(withdraw_amount);
        
    }
    
}
