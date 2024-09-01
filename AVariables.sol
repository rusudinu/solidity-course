// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AVariables {
    // boolean variable: can be either true or false
    bool public myBool = true;

    // string variable: used for storing text
    string public myString = "Hello, Solidity!";

    // signed integer: can be positive or negative, with different bit sizes
    int8 public myInt8 = - 128;         // minimum value -128, maximum value 127
    int16 public myInt16 = - 32768;     // minimum value -32768, maximum value 32767
    int public myInt = - 12345;         // by default, `int` is the same as `int256`
    int256 public myInt256 = - 123456789; // minimum value is -2^255, maximum value is 2^255-1

    // unsigned integer: only positive values, with different bit sizes
    uint8 public myUint8 = 255;        // minimum value 0, maximum value 255
    uint16 public myUint16 = 65535;    // minimum value 0, maximum value 65535
    uint public myUint = 12345;        // by default, `uint` is the same as `uint256`
    uint256 public myUint256 = 123456789; // minimum value 0, maximum value 2^256-1

    // fixed-point numbers: no longer supported in recent versions of Solidity
    // fixed public myFixed = 1.5;     // example of a signed fixed-point number (not supported)
    // ufixed public myUFixed = 1.5;   // example of an unsigned fixed-point number (not supported)

    // address type: used to store Ethereum addresses (20 bytes)
    address public myAddress = 0x1234567890123456789012345678901234567890;

    // Special Global Variables:

    // msg.data: complete calldata sent to the contract (bytes)
    bytes public myMsgData = msg.data;  // this returns the data of the transaction

    // msg.gas: remaining gas for the transaction (uint256)
    uint256 public myMsgGas = gasleft(); // this returns the remaining gas available

    // msg.sender: address of the caller (address)
    address public myMsgSender = msg.sender;  // this returns the address of the sender

    // msg.value: amount of ether sent with the message (uint256)
    uint256 public myMsgValue = msg.value;  // this returns the amount of wei sent with the transaction

    // Additional Types:
    // Array: dynamic or fixed-size array of elements
    uint[] public myUintArray = [1, 2, 3, 4, 5];

    // Enum: enumeration for user-defined types
    enum Status {Active, Inactive, Suspended}
    Status public myStatus = Status.Active;

    // Struct: user-defined type that groups variables
    struct Person {
        string name;
        uint age;
        address wallet;
    }

    Person public myPerson = Person("Alice", 30, 0x1234567890123456789012345678901234567890);
}
