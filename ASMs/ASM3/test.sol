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
        genes |= body << 0;
        genes |= uint32(eye) << 2;
        genes |= uint32(hairstyle) << 5;
        genes |= uint32(outfit) << 12;
        genes |= uint32(accessory) << 17;
        genes |= uint32(hiddenGenes) << 22;
        genes |= uint32(generation) << 24;
        // END CODE HERE

        return genes;
    }

function decodeAttributes(uint32 genes) public pure returns (uint8[7] memory) {
    uint8[7] memory attributes;

    attributes[0] = uint8(genes % 4);
    attributes[1] = uint8((genes / 4) % 8);
    attributes[2] = uint8((genes / 32) % 128);
    attributes[3] = uint8((genes / 1024) % 32);
    attributes[4] = uint8((genes / 32768) % 32);
    attributes[5] = uint8((genes / 1048576) % 4);
    attributes[6] = uint8((genes / 4194304) % 256);

    return attributes;
}
}
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
        //2,3,7,5,5,2,8
        genes |= body << 0;
        genes |= uint32(eye) << 2;
        genes |= uint32(hairstyle) << 5;
        genes |= uint32(outfit) << 12;
        genes |= uint32(accessory) << 17;
        genes |= uint32(hiddenGenes) << 22;
        genes |= uint32(generation) << 24;
        // END CODE HERE

        return genes;
    }

function decodeAttributes(uint32 genes) public pure returns (uint8[7] memory) {
    uint8[7] memory attributes;

    attributes[0] = uint8(genes % 4);
    attributes[1] = uint8((genes / 4) % 8);
    attributes[2] = uint8((genes / 32) % 128);
    attributes[3] = uint8((genes / 4096) % 32);
    attributes[4] = uint8((genes / 131072) % 32);
    attributes[5] = uint8((genes / 4194304) % 4);
    attributes[6] = uint8((genes / 16777216) % 256);

    return attributes;
}
}
