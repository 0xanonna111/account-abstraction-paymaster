const { ethers } = require("ethers");

async function getPaymasterData() {
    // Standard ERC-4337 Paymaster Data structure
    // This script helps generate the hex data for the paymasterAndData field
    const paymasterAddress = "0xYourPaymasterAddressHere";
    
    // Example: Append a dummy signature or timestamp for validation
    const dummySignature = ethers.hexlify(ethers.randomBytes(65));
    const paymasterAndData = ethers.concat([paymasterAddress, dummySignature]);
    
    console.log("Paymaster And Data (Hex):", paymasterAndData);
}

getPaymasterData();
