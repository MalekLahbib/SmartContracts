// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "./13-Owner.sol";

contract modifiers is Owner{
    uint nombre;

    function setNombre(uint _nombre) public isOwner{
        nombre = _nombre;
    }

    function getNombre() public view isOwner returns(uint){
        return nombre;
    }
}