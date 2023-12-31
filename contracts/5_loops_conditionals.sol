// SPDX-License-Identifier: MIT

//Version
pragma solidity ^0.8.0; 

contract lopps_conditionals {
    // Sum of the firt 10 numbers from the entered number
    function sum (uint256 _number) public pure returns (uint256) {
        uint256 aux_sum = 0;
        for (uint256 i = _number; i < (10+_number); i ++) {
            aux_sum = aux_sum + i;
        }
        return aux_sum;
    }

    //Sum of the firt 10 odd numbers
    function odd() public pure returns (uint256) {
        uint256 aux_sum = 0;
        uint256 counter = 1;
        while (counter < 10) {
            if(counter % 2 != 0) {
                aux_sum = aux_sum + counter;
            }
            counter ++;
        }
        return aux_sum;
    }

    

}