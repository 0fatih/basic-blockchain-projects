// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

                                Fallback Function
                                
    A contract can have at most one fallback function, declared using either `fallback () external [payable]` or 
    `fallback (bytes calldata _input) external [payable] returns (bytes memory _output)` 
    (both without the function keyword). This function must have external visibility. 
    A fallback function can be virtual, can override and can have modifiers.

    The fallback function is executed on a call to the contract if none of the other functions match the given 
    function signature, or if no data was supplied at all and there is no receive Ether function. The fallback 
    function always receives data, but in order to also receive Ether it must be marked payable.

    If the version with parameters is used, _input will contain the full data sent to the contract (equal to msg.data) 
    and can return data in _output. The returned data will not be ABI-encoded. Instead it will be returned without 
    modifications (not even padding).



*/


contract Test {
    // This function is called for all messages sent to this contract.
    // Sending Ether to this contract will cause an exception, because
    // the fallback function does not have the `payable` modifier.
    fallback() external { x = 1; }
    uint x;
}

contract TestPayable {
    // This function is called for all messages sent to this contract, except plain Ether transfers.
    // Any call with non-empty calldata to this contract will execute the fallback function (even if Ether is sent along with the call).
    fallback() external payable { x = 1; y = msg.value; }
    
    // This function is called for plain Ether transfers, i.e. for every call with empty calldata.
    receive() external payable { x = 2; y = msg.value; }
    uint x;
    uint y;
}

contract Caller {
    
    function callTest(Test test) public returns (bool) {
        (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        // results in text.x becoming == 1;
        
        // address(test) will not allow to call `send` directly since `test` has no payable fallback function.
        // It has to be converted to the `address payable` type to even allow calling `send` on it.
        address payable testPayable = payable(address(test));
        
        // If someone sends Ether to that contract, the transfer will fail, i.e. this returns false here.
        return testPayable.send(2 ether);
    }
    
    function callTestPayable(TestPayable test) public returns (bool) {
        (bool success, ) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        // results in text.x becoming == 1 and test.y becoming 0.
        
        (success, ) = address(test).call{value: 1}(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        // results in test.x becoming == 1 and test.y becoming 1.
        
        // If someone sends Ether to that contract, the receive function in TestPayable will be called.
        // Since that function writes to storage, it takes more gas than is available with a
        // simple ``send`` or ``transfer``. Because of that, we have to use a low-level call.
        (success,) = address(test).call{value: 2 ether}("");
        require(success);
        // results in test.x becoming == 2 and test.y becoming 2 ether.

        return true;
    }
    
    
}

