// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

//This contract uses a "Timelock" function, please note that if you actually use it, you CANNOT withdraw funds until the set date!!!!

contract Banking {

    address payable public favored; //Address that is going to receive the ETH.
    uint256 public withdrawDate; //Time - UnixTimeStamp

    constructor(address payable _favored, uint256 _withdrawDate) payable {
        require(_withdrawDate > block.timestamp);
        favored = _favored;
        withdrawDate = _withdrawDate;
    }

    function Withdraw() public {
        require(block.timestamp >= withdrawDate);
        payable (favored).transfer(address(this).balance);
    }
}