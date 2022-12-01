// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface BankInterface {
    function deposit() external payable;
    function withdraw() external;
}


contract TestBank {
    address bankAddress;

    constructor(address _bankAddress) payable{
        bankAddress = _bankAddress;
    }

    receive() external payable {}

    function testDeposit() external payable{
         BankInterface(bankAddress).deposit{value: 1 ether}();
    }

    function testWithdraw() external {
        BankInterface(bankAddress).withdraw();
    }

    function getBalance() external view returns(uint256){
        return address(this).balance;
    }
}
