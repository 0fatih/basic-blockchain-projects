// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;

contract Base1 {
    function foo() virtual public {}
}

contract Base2 {
    function foo() virtual public {}
}

contract Inherited is Base1, Base2 {
    // Derives from multiple base defining foo(), so we must explicitly override it 
    function foo() public override(Base1, Base2) {}
}
