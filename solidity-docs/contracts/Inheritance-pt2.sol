// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


contract owned {
    constructor() { owner = payable(msg.sender); }
    address payable owner;
}

contract Destructible is owned {
    function destroy() public virtual {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

contract Base1 is Destructible {
    function destroy() public virtual override { /* do cleanup 1 */ Destructible.destroy(); }
}

contract Base2 is Destructible {
    function destroy() public virtual override { /* do cleanup 2 */ Destructible.destroy(); }
}

contract Final is Base1, Base2 {
    function destroy() public override(Base1, Base2) { Base2.destroy(); }
    
    /*
        A call to Final.destroy() will call Base2.destroy because we specify it 
        explicitly in the final override, but this function will bypass Base1.destroy. 
        The way around this is to use super:
    
    
            function destroy() public override(Base1, Base2) { super.destroy(); }
    */    
}
