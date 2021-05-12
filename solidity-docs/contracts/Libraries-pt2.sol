// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

/*

    The following example shows how to use types stored in memory and 
    internal functions in libraries in order to implement custom types 
    without the overhead of external function calls:

*/

struct bigint {
    uint[] limbs;
}

library BigInt {
    function fromUint(uint x) internal pure returns(bigint memory r) {
        r.limbs = new uint[](1);
        r.limbs[0] = x;
    }
    
    function add(bigint memory _a, bigint memory _b) internal pure returns(bigint memory r) {
        r.limbs = new uint[](max(_a.limbs.length, _b.limbs.length));
        uint carry = 0;
        
        for(uint i =0; i < r.limbs.length; ++i) {
            uint a = limb(_a, i);
            uint b = limb(_b, i);
            r.limbs[i] = a + b + carry;
            
            if(a + b < a || (a + b == type(uint).max && carry > 0)) carry = 1;
            else carry = 0;
        }
        
        if(carry > 0) {
            // too bad, we have to add a limb.
            uint[] memory newLimbs = new uint[](r.limbs.length + 1);
            uint i;
            for(i = 0; i < r.limbs.length; ++i) newLimbs[i] = r.limbs[i];
            
            newLimbs[i] = carry;
            r.limbs = newLimbs;
        }
    }
    
    function limb(bigint memory _a, uint _limb) internal pure returns(uint) {
        return _limb < _a.limbs.length ? _a.limbs[_limb] : 0;
    }
    
    function max(uint a, uint b) private pure returns(uint) {
        return a > b ? a : b;
    }
}

contract C {
    using BigInt for bigint;
    function f() public pure {
        bigint memory x = BigInt.fromUint(8);
        bigint memory y = BigInt.fromUint(type(uint).max);
        bigint memory z = x.add(y);
        assert(z.limb(1) > 0);
    }
}

/*
    It is possible to obtain the address of a library by converting the library 
    type to the address type, i.e. using address(LibraryName).


    In comparison to contracts, libraries are restricted in the following ways:

        they cannot have state variables
        they cannot inherit nor be inherited
        they cannot receive Ether
        they cannot be destroyed
*/
