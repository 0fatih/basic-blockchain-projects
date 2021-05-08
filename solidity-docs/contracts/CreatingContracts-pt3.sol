// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract C {
    uint private data;
    
    function f(uint a) private pure returns(uint b) { return a + 1; }
    
    function setData(uint a) public { data = a; }
    
    function getData() public view returns(uint) { return data; }

    function compute(uint a, uint b) internal pure returns(uint) { return a + b; }
}

// This will not compile
contract D {
    function readData() public {
        C c = new C();
        uint local = c.f(7); // Error: Member 'f' is not visible.
        c.setData(3);
        local = c.getData();
        local = c.compute(3, 6); // Error: Member 'compute' is not visible.
    }
}

contract E is C {
    function g() public {
        C c = new C();
        uint val = compute(3, 6); // Acces to internal Member (from derived to parent contract)
    }
}
