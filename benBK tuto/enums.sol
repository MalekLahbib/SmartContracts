// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract enums {
    enum etape {commande, expedie, livre}

    struct produit {
        uint _SKU;
        enums.etape _etape;
    }

    mapping (address => produit) CommandesClients;

    function commander(address _client, uint _sku) public {
        produit memory p = produit(_sku,etape.commande);
        CommandesClients[_client] = p;
    }

    function expedier(address _client) public {
        CommandesClients[_client]._etape = etape.expedie;
    }

    function getSKU(address _client) public view returns(uint) {
        return CommandesClients[_client]._SKU;
    }

    function getEtape(address _client) public  view returns(etape) {
        return CommandesClients[_client]._etape;
    }
}