// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

/*

    Solidity supports `for`, `while`, `do while` loops.
    
    NOTE: Don't write loops that are unbounded as this can hit the gas limit,
    causing your transaction to fail.
    
    For the reason above, while and do while loops are rarely used.

*/

contract Loop {
    
    function loop() public {
        // for loop
        for(uint i = 0; i<10; i++){
            
            if(i == 3) continue;
            
            if(i == 5) break;
            
        }
        
        uint j;
        while(j < 10) j++;
    }
    
    
}
