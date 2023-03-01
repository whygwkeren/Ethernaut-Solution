// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Script.sol';

interface IToken {
  function transfer(address _to, uint _value) external returns (bool);
  function balanceOf(address _owner) external view returns (uint);
}

contract TokenScript is Script {
  address player = 0xA36ACa10170185F663C804f36e69D6BA0C62CED5;
  address bob = 0x96a2dE23725D66C7F72Df1FB6B5Db60F66dd2210;
  IToken target = IToken(0x4e333860bB2b1E11562C3a59aa2c69dA5cBFeB56);

  function run() external {
    vm.startBroadcast(vm.envUint('PRIVATE_KEY'));
    console.log("Token Player:", target.balanceOf(player));
    target.transfer(bob, 21);
    console.log("Token Player: ", target.balanceOf(player));
    console.log("Token Bob: ", target.balanceOf(bob));
    vm.stopBroadcast();
  }
}
