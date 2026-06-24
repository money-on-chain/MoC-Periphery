// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import { ITask } from "../ITask.sol";

contract TaskCoinbaseMock is ITask {
    address payable public immutable tasksRunner;

    /**
     * @notice Constructor
     * @param tasksRunner_ The address of the tasks runner contract.
     */
    constructor(address payable tasksRunner_) {
        tasksRunner = tasksRunner_;
    }

    /**
     * @inheritdoc ITask
     */
    function checkTask() external view returns (bool) {
        return true;
    }

    /**
     * @inheritdoc ITask
     */
    function runTask() external {
        uint256 coinbaseBalance = address(this).balance;
        (bool success, ) = tasksRunner.call{ value: coinbaseBalance }("");
        require(success, "Transfer failed");
    }
}
