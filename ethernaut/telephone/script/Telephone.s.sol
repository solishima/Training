// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Exploit} from "../src/Telephone.e.sol";
import {Telephone} from "../src/Telephone.sol";

contract TelephoneScript is Script {
    Exploit public exploitContract;
    uint256 deployerPrivateKey = vm.envUint("PK");
    address telephoneContractAddress = vm.envAddress("TARGET_CONTRACT_ADDRESS");
    address newOwner = vm.envAddress("PLAYER_ADDRESS");

    function setUp() public {
        console.log("Script owner", address(this));
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);

        exploitContract = new Exploit(telephoneContractAddress);

        // exploitContract.exploit(newOwner);
        console.log("Exploit is deployed at", address(exploitContract));

        vm.stopBroadcast();
    }
}
