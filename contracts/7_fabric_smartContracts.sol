// SPDX-License-Identifier: MIT

//Version
pragma solidity ^0.8.0; 

contract father {

    //Factory information storage
    mapping (address => address) public personal_contract;

    //Insuance of the new smart contracts
    function Factory() public {
        address addr_personal_contract = address (new children(msg.sender, address(this)));

        personal_contract[msg.sender] = addr_personal_contract;
    }


}


contract children {

    //Data received to the nww Smart Contract
    constructor (address _account, address _accountSC) {
        data_owner._owner = _account;
        data_owner._smartContractFather = _accountSC;
    }

    //Owner Data structures
    Data public data_owner;
    struct Data {
        address _owner;
        address _smartContractFather;

    }
}