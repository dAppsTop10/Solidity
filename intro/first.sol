// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;


contract dapps10 {
    string public name = "Oded Vanunu";

    function updateName(string memory _newName) public {
        name = _newName;
    }
}