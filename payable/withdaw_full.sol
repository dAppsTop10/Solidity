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

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send via call");

        emit Log("withdraw function", msg.sender, bal);
    }

    /*
    function withdraw() public {
        uint bal = balances[msg.sender];
        balances[msg.sender] = 0;

        // all the contract fails if the function fails.
        payable(address(msg.sender)).transfer(bal);

        // on failure return a boolean indicating success or failure.
        bool status = payable(address(msg.sender)).send(bal);
        require(status, "Failed to send via send");

        // returns an error message and a boolean on failure
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send via call");

        (bool sent, ) = msg.sender.call{value: bal}( abi.encodeWithSignature("deposit(uint256)", 100));
        require(sent, "Failed to send via call to function deposit");

        emit Log("withdraw function", msg.sender, bal);
    }
    */
}