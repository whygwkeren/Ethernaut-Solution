// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../script/Force.s.sol';
import '../lib/forge-std/src/Test.sol';


contract ForceTest is Test {
  address instance = 0x53bCB4c4b883567FD155f2561624BeBA52ff18c6;

  function test() external {
    address alice = vm.addr(1);
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    ForceScript target = (new ForceScript){value: 1000000 wei}();
    console.log("balance:", address(target).balance);
    console.log("balance: ", instance.balance);
    assertGt(instance.balance, 0);
  }
}
