// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract BFunctions {

    // State variable to demonstrate state-changing functions
    uint256 public storedNumber;

    // 1. Constructor function: Runs only once when the contract is deployed
    constructor(uint256 initialNumber) {
        storedNumber = initialNumber;  // Initialize the state variable
    }

    // 2. State-changing function: Modifies the state of the contract
    function setNumber(uint256 newNumber) public {
        storedNumber = newNumber;  // Updates the state variable
    }

    // 3. View function: Reads state data but does not modify it
    function getNumber() public view returns (uint256) {
        return storedNumber;  // Returns the state variable
    }

    // 4. Pure function: Does not read or modify state data, only works with local variables
    function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;  // Returns the sum of the two inputs
    }

    // 5. Payable function: Allows the contract to accept Ether
    function deposit() public payable {
        // Ether sent with the transaction is automatically added to the contract's balance
    }

    // 6. Fallback function: Executed when a non-existent function is called or when Ether is sent without data
    fallback() external payable {
        // Logic to handle unknown function calls or direct Ether transfers
    }

    // 7. Receive function: Executed when Ether is sent to the contract without any data (empty calldata)
    receive() external payable {
        // Logic to handle direct Ether transfers
    }

    // 8. Internal function: Only callable from within this contract or derived contracts
    function _internalFunction() internal view returns (uint256) {
        return storedNumber * 2;  // Returns double the stored number
    }

    // 9. External function: Callable only from outside the contract
    function externalFunction() external view returns (uint256) {
        return _internalFunction();  // Calls the internal function
    }

    // 10. Private function: Only callable from within this contract
    function _privateFunction() private view returns (uint256) {
        return storedNumber + 10;  // Returns the stored number plus 10
    }

    // 11. Public function: Callable from outside and inside the contract
    function publicFunction() public view returns (uint256) {
        return _privateFunction();  // Calls the private function
    }
}
