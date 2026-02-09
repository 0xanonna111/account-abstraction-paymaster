# Account Abstraction Paymaster

A professional implementation of the ERC-4337 Paymaster module. This project enables "Gas Abstraction," allowing dApps to sponsor user transactions or accept stablecoins (like USDC) for gas fees.

## Core Components
* **BasePaymaster**: The foundational logic for validating user operations and managing deposits in the EntryPoint contract.
* **TokenPaymaster**: Specifically designed to swap ERC-20 tokens for gas coverage.
* **Backend Relayer**: A script to sign paymaster data for off-chain gas sponsorship.

## How it Works
1. The user creates a `UserOperation`.
2. The Paymaster checks if it has enough deposit in the EntryPoint to cover the gas.
3. The Paymaster validates the signature or token balance of the user.
4. The transaction is executed, and gas is deducted from the Paymaster's stake.

## Deployment
* Deploy to any EVM chain supporting ERC-4337 (Polygon, Optimism, Arbitrum, etc.).
* Ensure the Paymaster is "staked" in the EntryPoint contract for production use.
