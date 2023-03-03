// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
import '../src/King.sol';
import '../script/King.s.sol';

contract KingTest is Test {
  King target = King(payable(0xa743e13003f545A2740d988E89169739D6da422f));
  address alice = vm.addr(1);
  address king = target._king();
  uint prize = target.prize();

  function test() external {
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    console.log(king);
    KingScript NewKing = new KingScript{value: prize}();
    console.log("Prize:", prize);
    console.log("New King:", target._king());
  }
}
