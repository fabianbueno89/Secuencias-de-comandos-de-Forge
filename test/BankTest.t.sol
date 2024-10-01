// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
        bank.deposit{value: 1 ether}();
        assertEq(bank.getBalance(), 1 ether);
    }

    function testWithdraw() public {
        bank.deposit{value: 1 ether}();
        bank.withdraw(0.5 ether);
        assertEq(bank.getBalance(), 0.5 ether);
    }

    function testWithdrawMoreThanBalanceFails() public {
        bank.deposit{value: 1 ether}();
        vm.expectRevert("Insufficient funds");
        bank.withdraw(2 ether);
    }

    // Fuzzing test: deposit and withdraw different amounts
    function testFuzz_DepositWithdraw(uint256 depositAmount, uint256 withdrawAmount) public {
        vm.assume(depositAmount >= withdrawAmount);
        bank.deposit{value: depositAmount}();
        bank.withdraw(withdrawAmount);
        assertEq(bank.getBalance(), depositAmount - withdrawAmount);
    }
}
