// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FarmToken is ERC20 {
	using Address for address;
    using SafeERC20 for IERC20;

	IERC20 public token;

	constructor(address _token) public ERC20("FarmToken", "FRM") {
		token = IERC20(_token);
	}

	// return the balance of MyToken on this smart contract
	function balance() public view returns(uint256) {
		return token.balanceOf(address(this));
	}


	// it will receive as parameter the amount the user wants to deposit and it will mint and transfer FarmTokens to the user:
	function deposit(uint256 _amount) public {
		// Amount must be greater than zero
		require(_amount > 0, "Amount cannot be 0!");

		// Transfer MyToken to smart contract
		token.safeTransferFrom(msg.sender, address(this), _amount);

		// Mint FarmToken to msg sender
		_mint(msg.sender, _amount);
	}


	// we will receive as parameter the amount of FarmTokens the user wants to burn and then transfer the same amount of MyTokens back to the user:
	function withdraw(uint256 _amount) public {
		// Burn FarmTokens from msg sender
		_burn(msg.sender, _amount);

		// Transfer MyTokens from this smart contract to msg sender
		token.safeTransfer(msg.sender, _amount);
	}



}