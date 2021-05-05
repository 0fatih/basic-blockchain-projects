// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.4;

contract InfoFeed {
    function info() public payable returns (uint ret) { return 42; }
}

contract Consumer {
    InfoFeed feed;
    function setFeed(InfoFeed addr) public { feed = addr; }
    function callFeed() public { feed.info{ value: 10, gas: 800}(); }
}
