// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IEntryPoint {
    function depositTo(address account) external payable;
}

contract SimplePaymaster is Ownable {
    IEntryPoint public immutable entryPoint;

    constructor(address _entryPoint) Ownable(msg.sender) {
        entryPoint = IEntryPoint(_entryPoint);
    }

    // Allows the owner to deposit ETH into the EntryPoint to sponsor gas
    function deposit() public payable {
        entryPoint.depositTo{value: msg.value}(address(this));
    }

    // ERC-4337 Validation Logic (Simplified for Demo)
    function validatePaymasterUserOp(bytes calldata userOp, bytes32 userOpHash, uint256 maxCost)
    external view returns (bytes memory context, uint256 validationData) {
        // In a real scenario, check signatures or pre-signed sponsorship data here
        return ("", 0);
    }

    function withdrawStake(address payable withdrawAddress) external onlyOwner {
        withdrawAddress.transfer(address(this).balance);
    }
}
