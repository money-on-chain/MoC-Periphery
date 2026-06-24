// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import { ITask } from "../ITask.sol";

/**
 * @title TaskMock
 */
contract TaskMock is ITask {
    bool public isAvailable = true;
    bool public failToRun = false;

    /**
     * @notice Constructor
     */
    constructor() {}

    /**
     * @inheritdoc ITask
     */
    function checkTask() external view returns (bool) {
        return isAvailable;
    }

    /**
     * @inheritdoc ITask
     */
    function runTask() external {
        require(!failToRun, "Task failed to run");
    }

    function setFailToRun(bool value) external {
        failToRun = value;
    }

    function setIsAvailable(bool value) external {
        isAvailable = value;
    }
}
