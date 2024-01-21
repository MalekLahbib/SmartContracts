// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract FactoryNumber {
    Number[] numberscontracts;

    function createNumberContract() external returns(address){
        Number n = new Number(100);
        numberscontracts.push(n);
        return address(n);
    }

    function getNumberByContract(Number _contract) external view returns(uint) {
        return _contract.getNumber();
    }

    function setNumberByContract(Number _contract, uint _number) external {
        _contract.setNumber(_number);
    }
}

contract Number {
    uint number;

    constructor(uint _number) {
        number = _number;
    }

    function getNumber() external view returns(uint) {
        return number;
    }

    function setNumber(uint _number) external {
        number = _number;
    }
}