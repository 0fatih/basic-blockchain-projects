// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract Oracle {
    
    struct Request {
        bytes data;
        function(uint) external callback;
    }
    
    Request[] private requests;
    event NewRequest(uint);
    
    function query(bytes memory data, function(uint) external callback) public {
        requests.push(Request(data, callback));
        emit NewRequest(requests.length - 1);
    }
    
    function reply(uint requestID, uint response) public {
        requests[requestID].callback(response);
    }
}

contract OracleUser {
    
    Oracle constant private ORACLE_CONST = Oracle(address(0x00000000219ab540356cBB839Cbe05303d7705Fa));
    uint private exchangeRate;
    
    function buySomething() public {
        ORACLE_CONST.query("USD", this.oracleResponse);
    }
    
    function oracleResponse(uint response) public {
        require(msg.sender == address(ORACLE_CONST), "Only oracle can call this.");
        exchangeRate = response;
    }
}
