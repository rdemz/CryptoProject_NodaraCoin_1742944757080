
  // SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;

  /**
   * @title NodaraToken
   * @dev Implémentation complète d'un token ERC-20 pour Nodara.
   */
  contract NodaraToken {
      string public name = "NodaraCoin";
      string public symbol = "NDRX";
      uint8 public decimals = 18;
      uint256 public totalSupply = 1000000 * 10 ** uint256(decimals);
      
      mapping(address => uint256) public balanceOf;
      event Transfer(address indexed from, address indexed to, uint256 value);

      constructor() {
          balanceOf[msg.sender] = totalSupply;
      }
      
      function transfer(address recipient, uint256 amount) public returns (bool) {
          require(balanceOf[msg.sender] >= amount, "Insufficient balance");
          balanceOf[msg.sender] -= amount;
          balanceOf[recipient] += amount;
          emit Transfer(msg.sender, recipient, amount);
          return true;
      }
  }
  