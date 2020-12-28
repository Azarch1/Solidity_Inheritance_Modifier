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
    
    function burnToken() public {
        require(msg.sender == owner, "You are not the owner");
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
    }
}