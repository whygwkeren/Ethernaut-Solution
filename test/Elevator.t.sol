// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '../lib/forge-std/src/Test.sol';
import '../src/Elevator.sol';
import '../script/Elevator.s.sol';

contract ElevatorTest is Test {
    Elevator target = Elevator(0xf6C5901884E7352D28993f8c310b4a1B34786067);
    address alice = vm.addr(1);

    function test() external {
        vm.deal(alice, 1 ether); 
        vm.startPrank(alice);
        ElevatorScript hack = new ElevatorScript();
        hack.attack();
        assertEq(target.top(), true);
        vm.stopPrank();
    }
  
}
