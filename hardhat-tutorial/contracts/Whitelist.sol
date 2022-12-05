//SPDX-license-Identifier: MIT
pragma solidity ^0.8.0;

contract WhiteList {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max number of whitelisted addresses reached");
        require(!whitelistedAddresses[msg.sender], "Address already whitelisted");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}