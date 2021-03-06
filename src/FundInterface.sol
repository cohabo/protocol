pragma solidity ^0.4.19;

import './assets/SharesInterface.sol';
import './assets/ERC223ReceivingContract.sol';

/// @title Fund Interface Contract
/// @author Melonport AG <team@melonport.com>
/// @notice This is to be considered as an interface on how to access the underlying Fund Contract
contract FundInterface is SharesInterface, ERC223ReceivingContract {

    // EVENTS

    event PortfolioContent(uint holdings, uint price, uint decimals);
    event RequestUpdated(uint id);
    event Subscribed(address indexed ofParticipant, uint atTimestamp, uint shareQuantity);
    event Redeemed(address indexed ofParticipant, uint atTimestamp, uint shareQuantity);
    event SpendingApproved(address onConsigned, address ofAsset, uint amount);
    event RewardsConverted(uint atTimestamp, uint shareQuantityConverted, uint unclaimed);
    event CalculationUpdate(uint atTimestamp, uint managementReward, uint performanceReward, uint nav, uint sharePrice, uint totalSupply);
    event OrderUpdated(uint id);
    event LogError(uint ERROR_CODE);
    event ErrorMessage(string errorMessage);

    // VIEW METHODS

    // Get general information
    function getCreationTime() constant returns (uint) {}
    function getBaseUnits() constant returns (uint) {}
    function getModules() constant returns (address ,address, address, address) {}
    function getStake() constant returns (uint) {}
    function getLastOrderId() constant returns (uint) {}
    function getLastRequestId() constant returns (uint) {}
    // Get accounting information
    function performCalculations() constant returns (uint, uint, uint, uint, uint, uint, uint) {}
    function calcSharePrice() constant returns (uint) {}

    // NON-CONSTANT METHODS

    // Compliance by Investor
    function requestSubscription(uint giveQuantity, uint shareQuantity, uint workerReward) external {}
    function requestRedemption(uint shareQuantity, uint receiveQuantity, uint workerReward) external {}
    function executeRequest(uint requestId) external {}
    function cancelRequest(uint requestId) external {}
    function redeemOwnedAssets(uint shareQuantity) external returns (bool) {}
    // Administration by Manager
    function enableSubscription() external {}
    function disableSubscription() external {}
    function enableRedemption() external {}
    function disableRedemption() external {}
    function shutDown() external {}
    // Managing by Manager
    function makeOrder(address sellAsset, address buyAsset, uint sellQuantity, uint buyQuantity) external {}
    function takeOrder(uint id, uint quantity) external {}
    function cancelOrder(uint id) external {}
    // Rewards by Manager
    function allocateUnclaimedRewards() {}
}
