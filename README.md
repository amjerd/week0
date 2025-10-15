# 🧠 Store & Retrieve Smart Contract

A simple Solidity project demonstrating how to store and retrieve data on the blockchain using Remix IDE and VS Code.

---

## 📘 Overview

This contract allows users to:
- Store a number on the blockchain  
- Retrieve that number anytime  

---

## 🧩 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StoreRetrieve {
    uint256 private number;

    // Function to store a number
    function store(uint256 num) public {
        number = num;
    }

    // Function to retrieve the stored number
    function retrieve() public view returns (uint256) {
        return number;
    }
}
