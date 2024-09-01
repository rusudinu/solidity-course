// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CModifiers {
    // State variable to demonstrate the use of modifiers
    address public owner;
    uint256 public value;

    // Constructor to set the initial owner of the contract
    constructor() {
        owner = msg.sender;  // The deployer of the contract becomes the owner
    }

    // 1. Basic Modifier: Restricts access to certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");  // Ensures that the caller is the owner
        _;  // Continue execution
    }

    // 2. Conditional Modifier: Requires a condition to be met before function execution
    modifier checkValue(uint256 _value) {
        require(_value > 0, "Value must be greater than zero");  // Ensures that the provided value is positive
        _;  // Continue execution
    }

    // 3. Modifier with Input: Allows modifiers to take arguments
    modifier limitValue(uint256 _maxValue) {
        require(value <= _maxValue, "Value exceeds limit");  // Ensures the state variable 'value' does not exceed '_maxValue'
        _;  // Continue execution
    }

    // 4. Multiple Modifiers: Combining more than one modifier
    modifier onlyOwnerAndCheckValue(uint256 _value) {
        require(msg.sender == owner, "Not the contract owner");  // Ensures that the caller is the owner
        require(_value > 0, "Value must be greater than zero");  // Ensures that the provided value is positive
        _;  // Continue execution
    }

    // Function using the basic modifier
    function setOwner(address newOwner) public onlyOwner {
        owner = newOwner;  // Updates the owner, restricted to the current owner
    }

    // Function using the conditional modifier
    function setValue(uint256 _value) public checkValue(_value) {
        value = _value;  // Updates the value, restricted to positive numbers
    }

    // Function using the modifier with input
    function increaseValue(uint256 _increment) public limitValue(100) {
        value += _increment;  // Increases the value, restricted to not exceeding 100
    }

    // Function using multiple modifiers
    function setValueAndOwner(uint256 _value, address newOwner) public onlyOwnerAndCheckValue(_value) {
        value = _value;  // Sets the new value
        owner = newOwner;  // Updates the owner, restricted to the current owner and positive value
    }

    // Modifier to check if a function can only be called once
    bool private called = false;
    modifier onlyOnce() {
        require(!called, "Function can only be called once");  // Ensures the function is called only once
        _;
        called = true;  // Mark as called after execution
    }

    // Function using the onlyOnce modifier
    function initializeValue(uint256 _value) public onlyOwner onlyOnce {
        value = _value;  // Initializes the value only once
    }
}
