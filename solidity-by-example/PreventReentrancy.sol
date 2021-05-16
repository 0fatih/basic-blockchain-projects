// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

                        Re-Entrancy Preventative Techniques

    - Ensure all state changes happen before calling external contracts
    - Use function modifiers that prevent re-entrancy

*/

contract ReEntrancyGuard {
    bool internal locked;
    
    modifier noReentrant() {
        require(!locked, "No re-entrancy!");
        locked = true;
        _;
        locked = false;
    }
}
