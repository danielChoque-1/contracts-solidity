// SPDX-License-Identifier: MIT

//Version
pragma solidity ^0.8.0; 

contract food {
    //Data structure 
    struct dinnertPlate {
        string  name;
        string ingredients;
    }

    // Menu of the day
    dinnertPlate[] menu;

    function newPlate (string memory _name, string memory _ingredients) internal {
        menu.push(dinnertPlate(_name, _ingredients));
    }
}

contract Hamburger is food {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    //Cooking a hamburger from the main conract
    function doHamburger(string memory _ingredients, uint256 _uints) external {
        require(_uints <= 5, "Ups, please check the uints of hamburgers!");
        newPlate("Hamburger", _ingredients);
    }

    //Function restricted to Smart Contract Owner
    function hashPrivateNumber (uint256 _number) public view onlyOwner returns (bytes32) {
        return keccak256(abi.encodePacked(_number));

    }

    //Modifier to allow access to the owner and only to the owner
    modifier onlyOwner () {
        require (owner == msg.sender, "You do not permissions to excecute this function");
        _;
    }


}