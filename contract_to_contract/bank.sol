// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Bank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];

        require(bal > 0, "No balance to withdraw");
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send via call");
    }
}