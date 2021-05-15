// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0-solc-0.7/contracts/token/ERC20/ERC20.sol";


/*

                                ERC20

    Any contract that follow the ERC20 standart is a ERC20 token.
    
    ERC20 tokens provide functionalities to:
        - Transfer tokens
        - Allow others to transfer tokens on behalf of the token holder.
    
    Here is the interface for ERC20:
    
    
    interface IERC20 {
        function totalSupply() external view returns (uint256);
        function balanceOf(address account) external view returns (uint256);
        function transfer(address recipient, uint256 amount) external returns (bool);
        function allowance(address owner, address spender) external view returns (uint256);
        function approve(address spender, uint256 amount) external returns (bool);
        function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    
        event Transfer(address indexed from, address indexed to, uint256 value);
        event Approval(address indexed owner, address indexed spender, uint256 value);
    }



    Using OpenZeppelin it's really easy to create your own ERC20 token.
    
    Here is an example:
*/




contract Token is ERC20 {

    constructor () ERC20("Token", "TKN") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
