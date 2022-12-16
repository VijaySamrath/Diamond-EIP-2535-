//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

library LibA {

struct DiamondStorage {
    address owner;
    bytes32 dataA;
}


function diamondStorage() internal pure returns(DiamondStorage storage ds) {
    bytes32 storagePosition = keccak256("diamond.storage.LibA");
    assembly {
    ds.slot := storagePosition
    }
}
}

contract FacetA {
    function setDataA(bytes32 _dataA) external {
        LibA.DiamondStorage storage ds = LibA.diamondStorage();
        ds.dataA = _dataA;
    }

    function getDataA() external view returns (bytes32) {
        return LibA.diamondStorage().dataA;
    }
}

// DiamondInit deployed: 0xD198F4320eA3d9f4e031dCa11c2dc7FECa0C981D

// Deploying facets
// DiamondCutFacet deployed: 0xF5A05e74664C84BF52Bc4998D7CE46b57A13F021
// DiamondLoupeFacet deployed: 0x5bd63f5Df8C77c282E032bC7545510760f5c7597
// OwnershipFacet deployed: 0x1dF0cefb27A3ed50b25AF6aF07b757fe8fE465c4

// Diamond deployed: 0x1319833F235BD711C1b48D81162B663B9a20EFF7