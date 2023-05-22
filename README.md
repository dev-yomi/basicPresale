
# Presale Smart Contract
This repository contains a Presale Smart Contract for Ethereum network written in Solidity programming language. It uses ERC20 tokens and includes security measures against reentrancy attacks.

## Contract Details
This contract represents a token presale mechanism where a user can buy a specified amount of tokens according to the established price.

### Here are the key details:

The contract uses ERC20 tokens.

The maximum number of tokens per wallet is defaulted to 690000000 tokens (assuming 18 decimal places).

The initial price per token is calculated based on the maximum tokens per wallet, specifically, 1 ether divided by the maximum tokens per wallet. (i.e. full allocation = 1 ETH)

The minimum buy value is defaulted to 0.01 ether.

The contract contains a flag isOpen which indicates whether the sale is open or not.

The contract keeps track of each user's token balance.

The contract can be controlled by its owner (deployer of the contract). Only the owner can withdraw Ether, toggle the sale open/closed, and adjust the price per token.
Functions
### The main functions of the contract are:

buy: Allows a user to buy tokens. This function checks whether the sale is open, if the value sent is greater than or equal to the minimum buy, if the amount of tokens a user will have after the operation doesn't exceed the maximum allowed, and if there are enough tokens left for the operation. It also updates the user's token balance and transfers the tokens.

withdrawEth: Allows the contract owner to withdraw the accumulated Ether.

toggleOpen: Allows the contract owner to open or close the sale.

adjustPricePerToken: Allows the contract owner to adjust the price per token.

### Usage
To use this contract, you will need to have a Solidity compiler version 0.8.0 or later.

To interact with this contract, deploy it to the Ethereum network of your choice (either a local test network, a testnet, or the mainnet). Be sure to provide the ERC20 token's address as an argument to the constructor function upon deployment.

### Dependencies
The contract uses OpenZeppelin's ERC20 and ReentrancyGuard contracts for secure and standard compliant token operations and to prevent reentrancy attacks, respectively.

### Note
Please remember that this is a basic contract and doesn't handle more complex features like tiered pricing or a whitelist of participants. Be sure to audit your contracts thoroughly before deploying them.

### Licence
This project is released under the MIT License.
