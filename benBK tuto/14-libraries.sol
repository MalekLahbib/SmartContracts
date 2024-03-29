// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/utils/Strings.sol";

contract librairies {

    function concatener(string memory _stringA, uint _numberA, uint _numberB) external pure returns(string memory) {
        string memory res = string(abi.encodePacked(_stringA, Strings.toString(_numberA), Strings.toString(_numberB)));
        return res;
    }
}