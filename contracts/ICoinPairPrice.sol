// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import { IERC20 } from "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/IERC20.sol";
import { IRegistry } from "./IRegistry.sol";
import { IOracleManager } from "./IOracleManager.sol";

interface ICoinPairPrice {
    event OracleRewardTransfer(uint256 roundNumber, address oracleOwnerAddress, address toOwnerAddress, uint256 amount);
    event PricePublished(address sender, uint256 price, address votedOracle, uint256 blockNumber);
    event EmergencyPricePublished(address sender, uint256 price, address votedOracle, uint256 blockNumber);
    event NewRound(
        address caller,
        uint256 number,
        uint256 totalPoints,
        uint256 startBlock,
        uint256 lockPeriodTimestamp,
        address[] selectedOracles
    );

    // prettier-ignore
    struct CoinPairPriceCallbacks {
        function (address) external view returns (address) getOracleOwnerAddress;
        function (address) external view returns (uint256) getOracleOwnerStake;
    }

    function subscribe(address oracleOwnerAddr) external;

    function unsubscribe(address oracleOwnerAddr) external;

    function isSubscribed(address oracleOwnerAddr) external view returns (bool);

    function publishPrice(
        uint256 _version,
        bytes32 _coinpair,
        uint256 _price,
        address _votedOracle,
        uint256 _blockNumber,
        uint8[] calldata _sigV,
        bytes32[] calldata _sigR,
        bytes32[] calldata _sigS
    ) external;

    function emergencyPublish(uint256 _price) external;

    function onWithdraw(address oracleOwnerAddr) external returns (uint256);

    function switchRound() external;

    function getAvailableRewardFees() external view returns (uint256);

    function peek() external view returns (bytes32, bool);

    function getPrice() external view returns (uint256);

    function getRoundInfo()
        external
        view
        returns (
            uint256 round,
            uint256 startBlock,
            uint256 lockPeriodTimestamp,
            uint256 totalPoints,
            address[] memory selectedOwners,
            address[] memory selectedOracles
        );

    function getOracleRoundInfo(address addr) external view returns (uint256 points, bool selectedInCurrentRound);

    function maxOraclesPerRound() external view returns (uint256);

    function roundLockPeriodSecs() external view returns (uint256);

    function isOracleInCurrentRound(address oracleAddr) external view returns (bool);

    function getSubscribedOraclesLen() external view returns (uint256);

    function getSubscribedOracleAtIndex(uint256 idx) external view returns (address ownerAddr);

    function getMaxSubscribedOraclesPerRound() external view returns (uint256);

    function getCoinPair() external view returns (bytes32);

    function getLastPublicationBlock() external view returns (uint256);

    function getValidPricePeriodInBlocks() external view returns (uint256);

    function getEmergencyPublishingPeriodInBlocks() external view returns (uint256);

    function getOracleManager() external view returns (IOracleManager);

    function getToken() external view returns (IERC20);

    function getRegistry() external view returns (IRegistry);

    function getMinOraclesPerRound() external view returns (uint256);
}
