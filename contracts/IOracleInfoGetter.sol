// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import { ICoinPairPrice } from "./ICoinPairPrice.sol";
import { IOracleManager } from "./IOracleManager.sol";

interface IOracleInfoGetter {
    struct FullOracleRoundInfo {
        uint256 stake;
        uint256 points;
        address addr;
        address owner;
        string name;
    }

    struct OracleServerInfo {
        uint256 round;
        uint256 startBlock;
        uint256 lockPeriodTimestamp;
        uint256 totalPoints;
        FullOracleRoundInfo[] info;
        uint256 price;
        uint256 currentBlock;
        uint256 lastPubBlock;
        bytes32 lastPubBlockHash;
        uint256 validPricePeriodInBlocks;
    }

    struct ManagerUIOracleInfo {
        uint256 stake;
        uint256 mocsBalance;
        uint256 basecoinBalance;
        address addr;
        address owner;
        string name;
    }

    struct ManagerUICoinPairInfo {
        address addr;
        bytes32 coinPair;
    }

    struct CoinPairUIOracleRoundInfo {
        uint256 points;
        bool selectedInRound;
        address addr;
    }

    struct CoinPairPriceUIInfo {
        uint256 round;
        uint256 startBlock;
        uint256 lockPeriodTimestamp;
        uint256 totalPoints;
        CoinPairUIOracleRoundInfo[] info;
        uint256 currentBlock;
        uint256 lastPubBlock;
        bytes32 lastPubBlockHash;
        uint256 validPricePeriodInBlocks;
        uint256 availableRewards;
    }

    function getCoinPairUIInfo(
        ICoinPairPrice _coinPairPrice
    ) external view returns (CoinPairPriceUIInfo memory coinPairPriceUIInfo);

    function getManagerUICoinPairInfo(
        IOracleManager _oracleManager,
        uint256 _offset,
        uint256 _limit
    ) external view returns (ManagerUICoinPairInfo[] memory info);

    function getManagerUIOracleInfo(
        IOracleManager _oracleManager,
        uint256 _from,
        uint256 _cant
    ) external view returns (ManagerUIOracleInfo[] memory info, address nextEntry);

    function getOracleServerInfo(
        IOracleManager _oracleManager,
        ICoinPairPrice _coinPairPrice
    ) external view returns (OracleServerInfo memory oracleServerInfo);
}
