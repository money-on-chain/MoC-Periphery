// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import { IERC20 } from "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/IERC20.sol";

interface ISupporters {
    event PayEarnings(uint256 earnings, uint256 start, uint256 end);
    event CancelEarnings(uint256 earnings, uint256 start, uint256 end);
    event AddStake(
        address indexed user,
        address indexed subaccount,
        address indexed sender,
        uint256 amount,
        uint256 mocs
    );
    event WithdrawStake(
        address indexed user,
        address indexed subaccount,
        address indexed destination,
        uint256 amount,
        uint256 mocs
    );

    function distribute() external;

    function isReadyToDistribute() external view returns (bool);

    function mocToken() external view returns (IERC20);

    function period() external view returns (uint256);

    function totalMoc() external view returns (uint256);

    function totalToken() external view returns (uint256);

    function getLockedBalance(address user) external view returns (uint256);

    function getLockingInfo(address user) external view returns (uint256 amount, uint256 untilTimestamp);

    function getBalanceAt(address _user, address _subaccount) external view returns (uint256);

    function getMOCBalanceAt(address _user, address _subaccount) external view returns (uint256);

    function getEarningsAt(uint256 _block) external view returns (uint256);

    function getLockedAt(uint256 _block) external view returns (uint256);

    function getEarningsInfo() external view returns (uint256 earnings, uint256 distributed, uint256 next);

    function getWhiteListLen() external view returns (uint256);

    function getWhiteListAtIndex(uint256 _idx) external view returns (address);

    function isWhitelisted(address _account) external view returns (bool);

    function mocToToken(uint256 _mocs) external view returns (uint256);

    function tokenToMoc(uint256 _token) external view returns (uint256);

    function tokenToMocUP(uint256 _token) external view returns (uint256);
}
