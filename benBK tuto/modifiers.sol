// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract modifiers {
    uint nombre;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setNombre(uint _nombre) public isOwner{
        nombre = _nombre;
    }

    function getNombre() public view isOwner returns(uint){
        return nombre;
    }
}