// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FunMe.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        vmSafe.startBroadcast();
        FundMe fundme_contract = new FundMe();
        vmSafe.stopBroadcast();

        return fundme_contract;
    }
}
