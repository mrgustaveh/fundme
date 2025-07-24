// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

error NotOwner();
error AmountTooLow();
error TransactionFailed();
event ReceivedEther(address sender, uint amount);

contract FundMe {
    address public immutable i_owner;
    uint256 public constant MIN_AMOUNT = 0.0001 ether;
    mapping (address => uint256) address_to_amount;

    constructor() {
        i_owner = msg.sender;
    }

    function fundContract() public payable {
        if (msg.value < MIN_AMOUNT) {
            revert AmountTooLow();
        } else {
            address_to_amount[msg.sender]=msg.value;
            emit ReceivedEther(msg.sender, msg.value);
        }
    }
    
    receive() external payable {
        fundContract();
    }

    fallback() external payable {
        fundContract();
    }

    function withdraw() public ownerAction {
        /*Transfer*/
        // payable(msg.sender).transfer(address(this).balance);

        /*Send*/
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess,"Transaction with send failed");

        /*Call*/
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        if (!callSuccess) {
            revert TransactionFailed();
        }
    }

    modifier ownerAction() {
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }
}
