# Degen Token - on Avalanche

This solidity project is an ERC20 smart contract where the user can mint, transfer, burn, and utilize the ERC20 token to redeem it for in-game items on the Avalanche Fuji testnet.

![image](https://github.com/user-attachments/assets/9d433bab-d6bc-4775-ac08-0ffa6adcf4b4)

## Description

This program is a simple contract written in Solidity and deployed using hardhat on the AVAX Fuji Testnet, which has the following main functions -
- `mint()` - Takes the address of the user and the amount to mint as parameters. It is an only owner function i.e. only the deployer can call this function.
- `transferto()` - Takes the address of the user and the amount of ERC20 tokens to transfer as parameters.
- `burn()` - Takes the amount of the tokens to burn as the parameter. The amount of tokens that burn are from the balance of the caller of the function(`msg.sender`).
- `redeemItems()` - Takes the ID of the item to redeem. Checks if the user already has the Item and if the user has enough ERC20 tokens to redeem the item in exchange.

## Getting Started

### Project Set-up
- `git clone` this repository and perform `npm install` in the terminal to install the dependencies required.
- Create a `.env` file inside the root folder of the project and store the private key of the account that contains some Fuji Test AVAX tokens. Like this
  ```env
  WALLET_PRIVATE_KEY=...................................
  ```
- Go to any Avalance Faucets to receive some Fuji test AVAX tokens, so that you can pay for Gas.
- Do not forget to add the Fuji Testnet network to your Metamask Network to check if you have actually received the tokens or not.
  
### Executing program

To run this program, you have to deploy the contract first. You can deploy it using this command
```bash
npx hardhat run scripts/deploy.js --network fuji
```
If nothing goes wrong, you will receive the address for the smart contract - 

![Screenshot from 2024-08-26 20-18-53](https://github.com/user-attachments/assets/d0b9d468-2821-444c-8a7a-a6cd7a0f07a0)

[Optional] - You can try to verify its deployment using the following command
```bash
npx hardhat verify --network fuji <YOUR_CONTRACT_ADDRESS>
```
And it will return this - 

![Screenshot from 2024-08-26 20-18-32](https://github.com/user-attachments/assets/3350c668-fb79-4d08-a90e-5d61cbf37346)

In order to test the functionality, Open REMIX IDE and paste the code from the Solidity smart contract there and compile it first - (*This is a required Step as you won't be able to test the functions otherwise.*).

Next, in the deploy section, Instead of deploying it through the REMIX VM, you simply have to change the environment to Metamask Injected Provider and you simply load the contract by pasting the contract address in the `atAddress` field as shown below.

![image](https://github.com/user-attachments/assets/99fd30ac-da71-4bf7-bb0b-7ca082075280)

This will allow you to access all the functions of the smart contract using Remix. 

![image](https://github.com/user-attachments/assets/ee9ed970-7e6e-4759-8481-6fabf2970e8d)

You can try tinkering with the values and finally you can verify them all on [Snowtrace](https://testnet.snowtrace.io/) like this -

![Screenshot from 2024-08-26 20-11-26](https://github.com/user-attachments/assets/f8f0366f-367b-4782-8716-53bef4aaa674)

## Authors

Siddhant Khare  
[@Siddhant4895](https://x.com/Siddhant4895)


# Happy Coding
