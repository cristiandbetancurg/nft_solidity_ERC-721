# 🎨NFT EN SOLIDITY CON EL STANDAR ERC-721

Contrato inteligente para colección NFT

ERC-721 fue creado para proporcionar la funcionalidad de hacer seguimiento y transferencia a los NFTs en los smart contracts. ERC-721 es un estandard abierto que describe cómo crear token No Fungibles en blockchains compatibles con EVM (Ethereum Virtual Machine)


# El Código

El contrato inteligente implementa todas las funciones del estándar ERC-721. Estas funciones permiten a los usuarios interactuar con los NFT, como comprarlos, venderlos y transferirlos.

Algunas de las funciones ERC-721 más importantes que puedes incluir a este código son:

balanceOf(): Devuelve el número de NFT que posee un determinado usuario.
ownerOf(): Devuelve la dirección del propietario de un determinado NFT.
transferFrom(): Transfiere un NFT de un usuario a otro.
approve(): Autoriza a un tercero a transferir un NFT en nombre del propietario.

## nft.sol

El contrato inteligente comienza definiendo los atributos de la colección: el nombre, el símbolo y el total de NFTs. 

A continuación, define la estructura de los NFT, que incluye el ID, la rareza y la URL de la imagen. El arreglo de NFTs se inicializa con 9999 NFTs pero este valor va depender de los objetivos de la colección, pero independientemente de la cantidad cada uno con un ID, una rareza y una URL de imagen aleatorias.

**El constructor** del contrato inicializa los atributos de la colección y genera los NFT. La función `generateRarity()` genera una rareza aleatoria para cada NFT. La función `getNFT()` devuelve el NFT con el ID especificado.

La función `mintNFT()` crea un nuevo NFT. El usuario debe pagar 0,01 ether para crear un nuevo NFT. La función genera un nuevo NFT, lo añade a la colección y actualiza el total de NFTs. El evento `MintedNFT` se emite cuando se crea un nuevo NFT.

## rareza.sol

La rareza de un NFT **se refiere a la singularidad de ese token en comparación con otros NFT de la misma colección**, su rareza lo vuelve escaso y es lo que se denomina escasez digital, por lo que implementar una rareza y un score es importante.

## generateRarity.sol

La función `generateRarity()` puede usar este enum para generar una rareza aleatoria. Con este puedes generar una rareza entre 0 y 7, correspondiente a las 8 rarezas definidas.
