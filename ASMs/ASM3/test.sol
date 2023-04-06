// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

contract Test {

    function encodeAttributes(
        uint8 body,
        uint8 eye,
        uint8 hairstyle,
        uint8 outfit,
        uint8 accessory,
        uint8 hiddenGenes,
        uint8 generation
    ) public pure returns (uint32) {
        uint32 genes = 0;

        // TASK #5: Encode attributes into uint32
        // START CODE HERE
        genes |= uint32(accessory) << 0;
        genes |= uint32(outfit) << 5;
        genes |= uint32(hairstyle) << 10;
        genes |= uint32(eye) << 17;
        genes |= uint32(body) << 20;
        genes |= uint32(hiddenGenes) << 22;
        genes |= uint32(generation) << 24;
        // END CODE HERE

        return genes;
    }

function decodeAttributes(uint32 genes) public pure returns (uint8[7] memory) {
    uint8[7] memory attributes;

    attributes[4] = uint8(genes % 32); //accessory
    attributes[3] = uint8((genes / 32) % 32); //outfit
    attributes[2] = uint8((genes / 1024) % 128); //hairstyle
    attributes[1] = uint8((genes / 131072) % 8); //eye
    attributes[0] = uint8((genes / 1048576) % 4); //body
    attributes[5] = uint8((genes / 4194304) % 4); //hiddenGenes
    attributes[6] = uint8((genes / 16777216) % 256); //generation

    return attributes;
}
}
