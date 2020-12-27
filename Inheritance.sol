pragma solidity ^0.7.4;

contract inheritanceModifier {
    mapping(address => uint) tokenBalance;
    
    address owner;
    
    uint tokenPrice = 1 ether;
    
    constructor() public {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }
    
    function createNewTokens() public {
        require(msg.sender == owner, "You are not the owner");
        tokenBalance[owner]++;
    }
}