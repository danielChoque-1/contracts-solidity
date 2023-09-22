// SPDX-License-Identifier: MIT

//Version
pragma solidity ^0.8.0; 

contract varibles_modifier {
    uint256 a;
    uint256 b = 3;

    //Integer values with signs (int)
    int256 c;
    int256 d = -32;
    int256 e = 65;

    //String variables
    string str;
    string public srt_public;
    string private  str_private;

    //Boolean variables
    bool boolean;
    bool public boolean_true = true;
    bool public boolean_false = false;

    //Butes variables
    bytes32 firt_bytes;
    bytes4 second_bytes;
    bytes32 public hashing = keccak256(abi.encodePacked("Hi"));


    //Addres variables
    address my_address;
    address public address1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public address2 = msg.sender;

    // Enumeration variables
    enum options {ON, OFF}
    options state;
    options constant defaulChoice = options.OFF;

    function turnOn() public {
        state = options.ON;
    }

    function turnOff() public {
        state = options.OFF;
    }

    function displayState() public view returns (options) {

        return state;
    }
}