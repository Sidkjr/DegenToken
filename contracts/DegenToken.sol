// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(address => mapping(uint => bool)) public usersInventory;
    mapping(uint256 => uint256) public itemPrice;
    address ownerofContract;

    constructor() ERC20("Degen", "DGN") {
        for(uint i = 1; i <= 10; i++) {
            itemPrice[i] = i*10;
        }
        ownerofContract = msg.sender;
    }

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }

        function transferto(address to, uint256 amount) public {
            require(balanceOf(msg.sender) >= amount);

            transfer(to, amount);
        }

        function burntokens(uint256 amount) public {
            require(balanceOf(msg.sender) >= amount);

            _burn(msg.sender, amount);
        }

        function reedemItems(uint256 _itemID) public {

            require(usersInventory[msg.sender][_itemID] == false, "You already have that Item in your inventory!");
            require(balanceOf(msg.sender) >= itemPrice[_itemID], "You don't have enough tokens to reedem this Item!");

            usersInventory[msg.sender][_itemID] = true;
            transfer(ownerofContract, itemPrice[_itemID]);
        }

        function getBalance() view public returns (uint){
            return balanceOf(msg.sender);
        }
}
