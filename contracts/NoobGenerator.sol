//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface GeneratorInterface {
    function contractType() external view returns (uint);
}

/**
 * @author Justa Liang
 * @notice Abstract contract of contract generator
 */
abstract contract NoobGenerator is Ownable, GeneratorInterface {

    /// @notice Admin contract address
    address public adminAddr;

    /// @notice Type of template contract
    uint public override contractType;

    /// @dev Commission for system developers
    uint8 constant private COMMISSION = 25;

    /// @dev Setup admin contract address
    constructor(
        address adminAddr_,
        uint contractType_
    ) {
        adminAddr = adminAddr_;
        contractType = contractType_;
    }
} 