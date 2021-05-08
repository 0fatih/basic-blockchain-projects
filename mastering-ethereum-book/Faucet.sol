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
            For now i don't know will it work. If i won't forget, i will take a look later.
        
        */
        payable(msg.sender).transfer(withdraw_amount);
        
    }
    
}
