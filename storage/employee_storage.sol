// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract dapps10 {
    struct Employee {
        string name;
        string jobTitle;
        uint age;
    }

    Employee public newEmployee;

    function updateEmployee(string calldata _name, string calldata _jobTitle, uint _age) external{

        // Employee storage copyOfEmployee = newEmployee; // points to same storage slot
        // copyOfEmployee.age = _age;
        // copyOfEmployee.name = _name;
        // copyOfEmployee.jobTitle = _jobTitle;

        // Same as before
        newEmployee.age = _age;
        newEmployee.name = _name;
        newEmployee.jobTitle = _jobTitle;
    }


    function getEmployee() external view returns (Employee memory){
        return newEmployee;
    }

}