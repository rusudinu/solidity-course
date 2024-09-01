// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract DmemoryStorage {

    // 1. State Variable (Stored in Storage)
    uint256[] public numbers;

    // Constructor to initialize the state variable
    constructor() {
        numbers.push(1);
        numbers.push(2);
        numbers.push(3);
    }

    // 2. Function to demonstrate Storage: Modifying the state variable directly
    function modifyStorage() public {
        uint256[] storage nums = numbers;  // Creates a storage reference to the state variable 'numbers'
        nums[0] = 10;  // Modifies the first element in the 'numbers' array directly in storage
    }

    // 3. Function to demonstrate Memory: Working with a copy of the state variable
    function modifyMemory() public view returns (uint256[] memory) {
        uint256[] memory nums = numbers;  // Creates a copy of the 'numbers' array in memory
        nums[0] = 20;  // Modifies the first element in the 'nums' array in memory
        return nums;   // Returns the modified copy, but the state variable 'numbers' remains unchanged
    }

    // 4. Function to demonstrate the effect on the original state variable
    function getNumbers() public view returns (uint256[] memory) {
        return numbers;  // Returns the original 'numbers' array stored in storage
    }

    // 5. Function to demonstrate Memory for Function Inputs
    function addNumberMemory(uint256[] memory newNumbers) public pure returns (uint256 sum) {
        for (uint256 i = 0; i < newNumbers.length; i++) {
            sum += newNumbers[i];  // Summing up elements, but 'newNumbers' is temporary and will be discarded after execution
        }
    }
}
