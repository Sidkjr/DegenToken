// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(address => mapping(string => bool)) public usersInventory;
    mapping(string => uint256) public itemPrice;
    address ownerofContract;

    constructor() ERC20("Degen", "DGN") {
        itemPrice['MightySword'] = 10;
        itemPrice['MagePotion'] = 20;
        itemPrice['InvisibilityCloak'] = 30;
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

        function reedemItems(string calldata _itemName ) public {

            require(usersInventory[msg.sender][_itemName] == false, "You already have that Item in your inventory!");
            require(balanceOf(msg.sender) >= itemPrice[_itemName], "You don't have enough tokens to reedem this Item!");

            usersInventory[msg.sender][_itemName] = true;
            transfer(ownerofContract, itemPrice[_itemName]);
        }

        function getBalance() view public returns (uint){
            return balanceOf(msg.sender);
        }
}
