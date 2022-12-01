// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
    uint8 private secret;
    address private owner;

    constructor (){
        owner = msg.sender;
        secret = uint8(block.timestamp);
    }

    modifier onlyOwner (){
        require(owner == msg.sender, "not owner");
        _;
    }
    
    function check(uint8 number) public view returns(string memory){
        if (number == secret){
            return "correct";
        }
        else if (number > secret){
            return "Your number is bigger than the secret";
        }
        else {
            return "Your number is lower than the secret";
        }
    }

    function getSecret() public onlyOwner view returns(uint8){
        return secret;
    }

    function setOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }
}
