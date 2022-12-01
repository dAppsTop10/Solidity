// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
    string private  name = "Oded Vanunu";
    string private  jobTitle = "Head of Products Vulnerability Research";

    function updateName(string memory _newName) public {
        name = _newName;
    }

    function updateTitle(string calldata _newTitle) public {
        jobTitle = _newTitle;
    }
}