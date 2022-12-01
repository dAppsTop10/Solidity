// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
    mapping(address => uint) public balances;
    event Log(string message, address wallet, uint value);

    receive() external payable {
        balances[msg.sender] += msg.value;
        emit Log("receive function", msg.sender, msg.value);
    }

    fallback() external payable {
        balances[msg.sender] += msg.value;
        emit Log("fallback function", msg.sender, msg.value);
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Log("deposit function", msg.sender, msg.value);
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        balances[msg.sender] = 0;
        emit Log("withdraw function", msg.sender, bal);
    }
}