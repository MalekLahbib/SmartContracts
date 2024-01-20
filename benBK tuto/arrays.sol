// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract arrays {
    uint[] nombres;

    function addValue(uint value) public {
        nombres.push(value);
    }

    function updateValue(uint _value, uint _index) public {
        nombres[_index] = _value;
    }

    function deleteValue(uint _index) public {
        delete nombres[_index];
    }

    function getValue(uint _index) public view returns(uint){
        return nombres[_index];
    }

    function getArray() public view returns(uint[] memory) {
        return nombres;
    }
}