// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;


contract dapps10 {
    int256 public result;
    address private owner;

    constructor (){
        owner = msg.sender;
    }

    function add(int256 num1, int256 num2) public {
        require(owner == msg.sender,"You are not the owner");
        _add(num1, num2);
    }

    function _add(int256 num1, int256 num2) public {
        result = num1 + num2;
    }
}