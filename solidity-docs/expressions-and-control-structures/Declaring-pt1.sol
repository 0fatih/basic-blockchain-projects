// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract C {
    
    /*
    
        Scoping in Solidity follows the widespread scoping rules of C99 
        (and many other languages): Variables are visible from the point 
        right after their declaration until the end of the smallest { }-block 
        that contains the declaration. As an exception to this rule, variables 
        declared in the initialization part of a for-loop are only visible until 
        the end of the for-loop.
    
    */
    
    function minimalScoping() pure public {
        {
            uint same;
            same = 1;
        }

        {
            uint same;
            same = 3;
        }
    }
    
}
