// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "./13-Owner.sol";

contract test is Owner{

    enum typeBien {terrain, appartement, maison}

    struct bien {
        uint id;
        string name;
        uint price;
        typeBien _typebien;
    }

    uint compteur;

    mapping (address => bien[]) Possessions;

    function addBien(address _proprietaire, string memory _name, uint _price, typeBien _typeBien) public isOwner {
        require(_price > 1000, "le bien doit valoir plus de 1000 wei");
        require( uint(_typeBien) >= 0, unicode"le type de bien doit être entre 0 et 2");
        Possessions[_proprietaire].push(bien(compteur, _name, _price, _typeBien));
        compteur++;
    }

    function getBiens(address _proprietaire) public view isOwner returns (bien[] memory) {
        return Possessions[_proprietaire];
    }

    function getNbrBiens(address _proprietaire) public view isOwner returns (uint) {
        return Possessions[_proprietaire].length;
    }

    function getMesBiens() public view returns (bien[] memory) {
        return Possessions[msg.sender];
    }
}