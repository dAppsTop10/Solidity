// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
   uint public currentBalance;

    receive() external payable {
        currentBalance = address(this).balance;
    }

    function sendTokens(address[] calldata recipients, uint256[] calldata values) external {
        uint total = 0;

        for (uint i = 0; i < recipients.length; i++) {
            total += values[i];
        }

        require(total < address(this).balance, "Not enough balance");

        for (uint i = 0; i < recipients.length; i++) {
            (bool sent, ) = msg.sender.call{value: values[i]}("");
            require(sent, "Failed to send via call");
        }
    }

}