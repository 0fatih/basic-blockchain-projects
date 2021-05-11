// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


// In case of multiple inheritance, all direct base contracts must be specified explicitly:

contract Base1 {
    modifier foo() virtual { _; }
}

contract Base2 {
    modifier foo() virtual { _; }
}

contract Inherited is Base1, Base2 {
    modifier foo() override(Base1, Base2) { _; }
}
