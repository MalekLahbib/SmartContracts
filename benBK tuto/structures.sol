// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract structures {
    struct Balance {
        uint money;
        uint nbrPayments;
    }

    mapping(address => Balance) Balances;

    function getBalance() public view returns(uint) {
        return Balances[msg.sender].money;
    } 

    function getNbrPayments() public view returns(uint) {
        return Balances[msg.sender].nbrPayments;
    }

    receive() external payable {
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].nbrPayments++;
    }
}