// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

import "./MyToken.sol";

contract DEX {
    
    IERC20 public token;
    
    event Bought(address buyer, uint256 amount);
    event Sold(address seller, uint256 amount);
    
    constructor() public {
        token = new MyToken(100000);
    }
    
    function buy() payable public {
        uint256 amountToBuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));
        
        require(amountToBuy > 0, "You need to send some Ether.");
        require(amountToBuy <= dexBalance, "Not enough tokens in the reserve.");
        
        token.transfer(msg.sender, amountToBuy);
        emit Bought(msg.sender, amountToBuy);
    }
    
    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens.");
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance.");
        token.transferFrom(msg.sender, address(this), amount);
        payable(msg.sender).transfer(amount);
        emit Sold(msg.sender, amount);
    }
}
