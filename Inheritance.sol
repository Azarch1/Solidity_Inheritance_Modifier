pragma solidity ^0.7.4;

import "./Owned.sol";

contract inheritanceModifier is Owned{
    mapping(address => uint) public tokenBalance;
    
    
    
    uint tokenPrice = 1 ether;
    
    constructor() public {
        tokenBalance[owner] = 100;
    }
    
    function createNewTokens() public onlyModifier {
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyModifier {
        tokenBalance[owner]--;
    }
    
    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough funds");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    
    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "You do not have enough funds");
        assert(tokenBalance[_to] +_amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
    
}