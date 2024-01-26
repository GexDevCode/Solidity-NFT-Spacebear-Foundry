// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract Spacebear is ERC721 {
    uint256 private _tokenIdCounter;

    constructor() ERC721("Spacebear", "SCB") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/";
    }

    function buyToken() public payable {
        uint256 tokenId = _tokenIdCounter;
        require(msg.value == tokenId * 0.1 ether, "Wrong amount of funds sent");

        _tokenIdCounter++;
        _safeMint(msg.sender, tokenId);
    }

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        pure
        override(ERC721)
        returns (string memory)
    {
        return string(abi.encodePacked(_baseURI(), "spacebear_", Strings.toString(tokenId+1), ".json"));
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}