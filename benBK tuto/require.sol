// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract exercise {
    
    uint nombre;

    function setNombre(uint _nombre) public{
        require(_nombre != 10, "le nombre doit etre different de 10");
        nombre = _nombre;
    }

    function getNombre() public view returns(uint) {
        return nombre;
    }
}