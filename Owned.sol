pragma solidity ^0.7.4;

contract Owned {
    address owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier onlyModifier() {
       require(msg.sender == owner, "You are not the owner");
        _;
    }
}