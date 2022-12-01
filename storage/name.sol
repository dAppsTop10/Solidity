// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
    string private  name = "Dikla Barda";
    string private  jobTitle = "Security Research";

    function updateName(string memory _newName) public {
        name = _newName;
    }

    function updateTitle(string calldata _newTitle) public {
        jobTitle = _newTitle;
    }
}