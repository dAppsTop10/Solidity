// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
   uint public currentBalance;

    receive() external payable {
        currentBalance = address(this).balance;
    }

    function sendTokens(address[] calldata recipients, uint256[] calldata values) external {
        uint total = 0;
        uint i = 0;

        while(i < recipients.length) {
            total += values[i];
            i++;
        }

        require(total < address(this).balance, "Not enough balance");
        i = 0;

        while(i < recipients.length) {
            (bool sent, ) = msg.sender.call{value: values[i]}("");
            require(sent, "Failed to send via call");
            
            i++;
        }

    }

}