// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract mappings {
    mapping (address => uint) Balances;

    function getBalances(address monAdresse) public view returns(uint) {
        return Balances[monAdresse];
    }
    
    receive() external payable {
        Balances[msg.sender] = msg.value;
    }
}