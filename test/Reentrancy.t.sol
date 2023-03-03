// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../src/Reentrancy.sol';
import '../script/Reentrancy.s.sol';
import '../lib/forge-std/src/Test.sol';

contract ReentrancyTest is Test {
  Reentrance target = Reentrance(payable(0xa2781d8D150c9247B6d42766F855ae4E23c6A3d1));
  address alice = vm.addr(1);
  address bob = vm.addr(2);
  ReentrancyScript hack;

  function test() external {
    vm.deal(alice, 10 ether);
    vm.startPrank(alice);
    hack = new ReentrancyScript{value: 1 ether}();
    console.log(address(target).balance);
    hack.attack();
    console.log(address(target).balance);
    hack.withdraw();
    console.log(address(target).balance);
    assertEq(address(target).balance, 0);
    hack.refund(alice);
    assertEq(address(hack).balance, 0);
    vm.stopPrank();
  }
}
