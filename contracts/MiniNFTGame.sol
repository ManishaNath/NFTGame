// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


// @title A contract for Designing a mini-game using NFTs
// @dev This contract inherits ERC721 from openzeppelin
contract MiniNFTGame is ERC721 {
    struct NFT {
        uint256 health;
        uint256 price;
        string name; 
        string symbol; 
    }
    
    mapping(uint256 => NFT) public nfts;
    
    //// @notice A mapping for Adding Team A and Team B
    mapping(address => mapping(uint256 => bool)) public teamA;
    mapping(address => mapping(uint256 => bool)) public teamB;
    
    constructor() ERC721("Kreator", "KV") {}
    
  function create_NFT(uint256 _tokenId, uint256 _initialPrice, string memory _name, string memory _symbol) external {
        require(!_exists(_tokenId), "Token already exists!");
        _safeMint(msg.sender, _tokenId);
        nfts[_tokenId] = NFT(_initialPrice, _initialPrice, _name, _symbol);
    }
    
    function update_Health(uint256 tokenId, uint256 growthPercentage) external {
        require(_exists(tokenId), "TokenId does not exist! Retry!");
        nfts[tokenId].health = growthPercentage * 100;
    }
    
    //// @notice A function to Assign NFTs to Team A
    function assignNFT_To_TeamA(uint256 _tokenId) external {
        require(ownerOf(_tokenId) == msg.sender, "You are not the owner of this NFT! Abort!");
        teamA[msg.sender][_tokenId] = true;
    }
    
    //// @notice A function to Assign NFTs to Team B
    function assignNFT_To_TeamB(uint256 _tokenId) external {
        require(ownerOf(_tokenId) == msg.sender, "You are not the owner of this NFT! Abort!");
        teamB[msg.sender][_tokenId] = true;
    }
    
    //// @notice A function to Calculate Team A's total health
    function getTeamAHealth() public view returns (uint256) {
        uint256 totalHealth = 0;
        for (uint256 _tokenId = 0; _tokenId < 4; _tokenId++) {
            if (teamA[msg.sender][_tokenId]) {
                totalHealth += nfts[_tokenId].health;
            }
        }
        return totalHealth;
    }
    
    //// @notice A function to Calculate Team B's total health
    function getTeamBHealth() public view returns (uint256) {
        uint256 totalHealth = 0;
        for (uint256 _tokenId = 0; _tokenId < 4; _tokenId++) {
            if (teamB[msg.sender][_tokenId]) {
                totalHealth += nfts[_tokenId].health;
            }
        }
        return totalHealth;
    }
    
    //// @notice A function to Determine The winner (among Team A and B) is the team with the highest “Health” in the portfolio.
    function getWinner() public view returns (string memory) {
        uint256 teamA_Health = getTeamAHealth();
        uint256 teamB_Health = getTeamBHealth();
        
        if (teamA_Health > teamB_Health) {
            return "Team A is the winner of this Game!";
        } else if (teamB_Health > teamA_Health) {
            return "Team B is the winner of this Gamew!";
        } else {
            return "It's a tie!";
        }
    }
}