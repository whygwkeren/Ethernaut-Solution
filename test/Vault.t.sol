// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
// import '../src/Vault.sol';

interface IVault {
  function locked() external view returns (bool);
  function unlock(bytes32 _password) external;
}

contract VaultTest is Test {
  IVault target = IVault(0x40EE97BA64F83cDfE6f22EBAe9ca0575Aa002A9c);
  bytes32 password = vm.load(address(target), bytes32(uint256(1)));

  function test() external {
    address alice = vm.addr(1);
    vm.deal(alice, 1 ether);
    vm.startPrank(alice);
    target.unlock(password);
    assertEq(target.locked(), false);
  }
}
