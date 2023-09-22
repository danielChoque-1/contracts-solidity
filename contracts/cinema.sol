// SPDX-License-Identifier: MIT

//Version
pragma solidity ^0.8.0; 

import "@openzeppelin/contracts@4.4.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";

contract Cinema is ERC20, Ownable {
    //Constructor
    constructor () ERC20("Movies", "MC") {
        _mint(address(this), 1000);

    }

    //Data structure to store customer data
    struct customer {
        uint256 tokens_purchased;
        string [] enjoyed_movies;

    }

    //Mapping for customer registration
    mapping (address => customer) public Customers;

    //Token Management

    //Function to set the price of a Token
    function priceTokens(uint256 _numTokens) internal pure returns (uint256) {
        return _numTokens * (1 ether); 
    }

    //Function to view the account token balance
    function balanceTokens(address _acount) public view returns (uint256){
        return balanceOf(_acount);
    }

    //Function to min more tokens
    function mint(uint256 _amount) public onlyOwner {
        _mint(address(this), _amount);
    }

    //Function to boy tokens
    function purchaseTokens(uint256 _numTokens) public payable {
        //Set the price of tokens
        uint256 cost = priceTokens(_numTokens);
        //The money that the customer pays for the tokens is evaluated

        require(msg.value >= cost, 
                "Boy less tokens of pay whit more ethers.");

        //Obtaning the number of tokens avaiable from the Smart Contract
        uint256 balance = balanceTokens(address(this));
        require (_numTokens <= balance, "Buy a smaller number of tokens.");

        //The returnValue is defined as what the customer pays minus what the product us whorth
        uint256 returnValue = msg.value - cost;

        //The company send the amount of ethers of the customer
        payable(msg.sender).transfer(returnValue);

        //the number of tokens purchased is transferred to the customer
        _transfer(address(this), msg.sender, _numTokens);
        
        //Registration of purchased tokens
        Customers[msg.sender].tokens_purchased += _numTokens;
    }

    

    // Function for a customer to exchange tokens fot ethers
    function tokensEthers(uint256 _numTokens) public payable {

        //Verify that the number of tokens is correct
        require(_numTokens > 0, 
                "You need to return a positive amount of tokens.");  

        require(_numTokens <= balanceTokens(msg.sender), 
                "You do not have the tokens you wish to return.");

        //Step-1: Sending tokens to the Smart Contact
        _transfer(msg.sender, address(this), _numTokens);

        //Step-2: Sending ethers to the customer
        payable(msg.sender).transfer(priceTokens(_numTokens));
    }

}
