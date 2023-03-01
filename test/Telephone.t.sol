// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
// import '../src/Telephone.sol';

interface ITelephone {
  function owner() external view returns (address);
  function changeOwner(address _owner) external;
}

contract TelephoneTest is Test {
  ITelephone target = ITelephone(0x201000349F8E018498AeEe55bF9092Ab9D44cf16);
//  Telephone target = Telephone(0x201000349F8E018498AeEe55bF9092Ab9D44cf16);
  function test() external {
    console.log(target.owner());
    address alice = vm.addr(1);
    vm.deal(alice, 1 ether);
    vm.prank(alice);
    target.changeOwner(alice);
    console.log(target.owner());
    assertEq(target.owner(), alice);
  }
}
