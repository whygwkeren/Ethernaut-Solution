// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';

interface IToken {
  function transfer(address _to, uint _value) external returns (bool);
  function balanceOf(address _owner) external view returns (uint);
}

contract TokenTest is Test {
  IToken target = IToken(0x4e333860bB2b1E11562C3a59aa2c69dA5cBFeB56);
  address alice = vm.addr(1);
  address bob = vm.addr(2);

  function test() external {
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    console.log("balance: ", target.balanceOf(alice), "Token");
    target.transfer(bob, 21);
    assertGt(target.balanceOf(alice), 0);
    console.log("balance: ", target.balanceOf(alice), "Token");
  }
}
