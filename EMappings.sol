// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract EMappings {

    // 1. Basic Mapping: Maps an address to a uint256 (like a balance)
    mapping(address => uint256) public balances;

    // 2. Nested Mapping: Maps an address to another mapping (useful for multi-level data)
    mapping(address => mapping(address => uint256)) public allowances;

    // 3. Mapping to Struct: Maps an address to a custom data structure (useful for complex data storage)
    struct User {
        string name;
        uint256 age;
        bool isActive;
    }

    mapping(address => User) public users;

    // 4. Mapping to Arrays: Maps an address to an array of uint256 (useful for storing a list of values)
    mapping(address => uint256[]) public userTransactions;

    // 5. Mapping with Enum: Maps an address to an enum (useful for managing user states)
    enum Status {Active, Inactive, Suspended}
    mapping(address => Status) public userStatus;

    // Function to update the balance for an address
    function updateBalance(address _user, uint256 _amount) public {
        balances[_user] = _amount;  // Sets the balance of '_user' to '_amount'
    }

    // Function to set an allowance (nested mapping)
    function setAllowance(address _owner, address _spender, uint256 _amount) public {
        allowances[_owner][_spender] = _amount;  // Sets the allowance for '_spender' by '_owner' to '_amount'
    }

    // Function to add or update a user (mapping to struct)
    function addUser(address _user, string memory _name, uint256 _age) public {
        users[_user] = User(_name, _age, true);  // Adds or updates the '_user' with name and age, and sets 'isActive' to true
    }

    // Function to add a transaction for a user (mapping to array)
    function addTransaction(address _user, uint256 _amount) public {
        userTransactions[_user].push(_amount);  // Adds '_amount' to the array of transactions for '_user'
    }

    // Function to update the status of a user (mapping with enum)
    function updateUserStatus(address _user, Status _status) public {
        userStatus[_user] = _status;  // Sets the status of '_user' to the given '_status'
    }

    // Function to retrieve the number of transactions for a user
    function getTransactionCount(address _user) public view returns (uint256) {
        return userTransactions[_user].length;  // Returns the number of transactions for '_user'
    }

    // Function to retrieve a specific transaction by index
    function getTransactionByIndex(address _user, uint256 _index) public view returns (uint256) {
        require(_index < userTransactions[_user].length, "Index out of bounds");
        return userTransactions[_user][_index];  // Returns the transaction at the given '_index' for '_user'
    }
}
