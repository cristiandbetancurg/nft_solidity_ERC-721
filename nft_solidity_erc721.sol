pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTCollection is ERC721 {

  // Atributos de la colección

  string public name;
  string public symbol;
  uint256 public totalSupply;

  // Estructura de los NFT

  struct NFT {
    uint256 id;
    uint8 rarity;
    string imageURI;
  }

  // Array 

  NFT[] public NFTs;

  // Constructor

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
    name = _name;
    symbol = _symbol;
    totalSupply = 9999;

    // Inicializa los NFT

    for (uint256 i = 0; i < totalSupply; i++) {
      NFTs.push(NFT(i, generateRarity(), "https://example.com/image/" + i));
    }
  }

  // Genera una rareza aleatoria

  function generateRarity() private returns (uint8) {
    return uint8(keccak256(abi.encodePacked(block.timestamp, block.number)) % 8);
  }

  // Devolvemos el NFT con el ID especificado

  function getNFT(uint256 _id) public view returns (NFT memory) {
    return NFTs[_id];
  }

  // Crea un nuevo NFT

  function mintNFT() public payable {
    // Comprueba que el usuario haya pagado la cantidad correcta

    require(msg.value == 0.01 ether);

    // Se genera un nuevo NFT

    NFT memory newNFT = NFT(totalSupply, generateRarity(), "https://example.com/image/" + totalSupply);

    // Añade el nuevo NFT a la colección

    NFTs.push(newNFT);

    // Actualiza el total de NFTs

    totalSupply++;

    // Asigna el NFT al usuario que lo ha creado

    safeTransferFrom(address(0), msg.sender, newNFT.id);
  }

  // Funciones del standar ERC-721

  function supportsInterface(bytes4 interfaceID) public view returns (bool) {
    return ERC721.supportsInterface(interfaceID);
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return ERC721.balanceOf(_owner);
  }

  function ownerOf(uint256 _tokenId) public view returns (address) {
    return ERC721.ownerOf(_tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) public payable {
    ERC721.transferFrom(_from, _to, _tokenId);
  }

  function approve(address _to, uint256 _tokenId) public payable {
    ERC721.approve(_to, _tokenId);
  }

  function transfer(address _to, uint256 _tokenId) public payable {
    ERC721.transfer(_to, _tokenId);
  }

  function getApproved(uint256 _tokenId) public view returns (address) {
    return ERC721.getApproved(_tokenId);
  }

  function setApprovalForAll(address _operator, bool _approved) public {
    ERC721.setApprovalForAll(_operator, _approved);
  }

  function isApprovedForAll(address _owner, address _operator) public view returns (bool) {
    return ERC721.isApprovedForAll(_owner, _operator);
  }
}
