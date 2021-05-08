// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

    When creating a contract, the address of the contract is computed from the address of the creating contract and a counter that is increased with each contract creation.

    If you specify the option salt (a bytes32 value), then contract creation will use a different mechanism to come up with the address of the new contract:

    It will compute the address from the address of the creating contract, the given salt value, the (creation) bytecode of the created contract and the constructor arguments.

    In particular, the counter (“nonce”) is not used. This allows for more flexibility in creating contracts: You are able to derive the address of the new contract before it is created. Furthermore, you can rely on this address also in case the creating contracts creates other contracts in the meantime.

    The main use-case here is contracts that act as judges for off-chain interactions, which only need to be created if there is a dispute.

*/



contract D {
    uint public x;
    constructor(uint a) {
        x = a;
    }
}

contract C {
    function createDSalted(bytes32 salt, uint arg) public {
        /*
            This complicated expression just tells you how the addres can be pre-computed.
            It is just there for illustration.
            You actually only need 'new D{salt: salt}(arg)'
        
        */
        
        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                type(D).creationCode,
                arg
                ))
            )))));
        
        D d = new D{salt: salt}(arg);
        require(address(d) == predictedAddress);
    }
}
