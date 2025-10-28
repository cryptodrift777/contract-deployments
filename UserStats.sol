// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title UserStats - Simple contract to track new unique users
/// @notice Works on Base or any EVM-compatible network

contract UserStats {
    // Keeps track of whether an address has interacted before
    mapping(address => bool) public hasInteracted;

    // Total number of unique users
    uint256 public totalUsers;

    // Event emitted when a new user interacts for the first time
    event NewUser(address indexed user, uint256 totalUsers);

    /// @notice Called by a user to register their first interaction
    function register() external {
        if (!hasInteracted[msg.sender]) {
            hasInteracted[msg.sender] = true;
            totalUsers += 1;
            emit NewUser(msg.sender, totalUsers);
        }
    }

    /// @notice Check if a user has already registered
    function isRegistered(address user) external view returns (bool) {
        return hasInteracted[user];
    }

    /// @notice Get the total number of unique registered users
    function getTotalUsers() external view returns (uint256) {
        return totalUsers;
    }
}

