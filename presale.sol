pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Presale is ReentrancyGuard {

    ERC20 token;

    uint256 maxTokensPerWallet = 690000000 ether;
    uint256 pricePerToken = 1e18 / maxTokensPerWallet;
    uint256 minimumBuy = 0.01 ether;

    bool public isOpen;

    mapping(address => uint256) userBalances;

    address owner;

    constructor(address _token){
        token = ERC20(_token);
        owner = payable(msg.sender);
        isOpen = true;
    }

    function buy() public payable nonReentrant {
        require(isOpen, "Sale not open!");
        require(msg.value >= minimumBuy, "You must buy at least 0.01 Eth worth of tokens!");
        uint256 amountOfTokens = msg.value / pricePerToken;
        require(userBalances[msg.sender] + amountOfTokens <= maxTokensPerWallet, "That will exceed the max allocation!");
        require(token.balanceOf(address(this)) >= amountOfTokens, "Not enough tokens left!");
        userBalances[msg.sender] += amountOfTokens;
        token.transfer(msg.sender, amountOfTokens);
    }

    function withdrawEth() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function toggleOpen() external onlyOwner {
        isOpen = !isOpen;
    }

    function adjustPricePerToken(uint256 _pricePerToken) external onlyOwner {
        pricePerToken = _pricePerToken;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner.");
        _;
    }
}
