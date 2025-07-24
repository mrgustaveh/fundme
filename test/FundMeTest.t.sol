// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {VmSafe} from "forge-std/Vm.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe contractFundMe;

    function setUp() external {
        contractFundMe = new FundMe();
    }

    function testMinValue() public view {
        assertEq(contractFundMe.MIN_AMOUNT(), 1e14);
    }

    function testOwnerIsSender() public view {
        assertEq(contractFundMe.i_owner(), address(this));
    }
}
