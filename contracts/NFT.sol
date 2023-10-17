// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    uint256 public maxSupply = 8;
    uint256 public cost = 0.001 ether;
    string public baseURI = "ipfs://QmTzGNEyNdUADgf5w4FaqjDuFEVeSyizsxCtQtkv12U9rC/";

    constructor() ERC721("Kim Bok-joo", "KBJ") {}

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
    }

    function changeBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function safeMint(address _to) public payable {
        uint256 _currentSupply = totalSupply();
        require(_currentSupply < maxSupply, "You reached max supply");
        require(msg.value == cost, "Please add a valid amount of ETH");
        _safeMint(_to, _currentSupply);
    }

    function withdraw() public onlyOwner {
        (bool success, ) = payable(owner()).call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }

    function _requireMinted(uint256 tokenId) internal view {
        require(tokenId < totalSupply(), "Token not minted");
    }
}
