# 🎓 Student Info Smart Contract

A simple Solidity smart contract that allows students to **store** and **retrieve** their personal information (name and score) on the blockchain.  
This project was created to learn how to use **structs**, **mappings**, and **functions** in Solidity.

---

## 📘 Overview

The goal of this contract is to help users understand:
- How to define and use **structs** in Solidity  
- How to use **mappings** to associate data with string(reg No) 
- How to write functions that store and read blockchain data  

Each student’s information is tied to their registration number no duplication.  
This means every Registration number can store its own name and score without affecting others.

---

## 🧩 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StudentInfo {
    // Struct to store student details
    struct Student {
        string name;
        uint256 score;
        string RegNo;
    }

    // Mapping to store each student's info by their Registration number
     mapping (string => Student)public Students;
  //to make sure no student is added twice
  mapping (string => bool) public isregNoExist;

    // Function to add or update your student information
    function addMyInfo(string memory _name, uint256 _score) public {
        students[msg.sender] = Student(_name, _score);
    }

    // Function to view your stored information
    function getMyInfo() public view returns (string memory, uint256) {
        Student memory s = students[msg.sender];
        return (s.name, s.score);
    }
}
