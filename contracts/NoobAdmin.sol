//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "./NoobGenerator.sol";

/**
 * @author Justa Liang
 * @notice Entry for creating template contracts
 */
contract NoobAdmin is Ownable, PaymentSplitter {

    /// @notice Store user-issued contract
    mapping (address => address[]) public userContracts;

    /// @notice Map type index to generator address
    mapping (uint => GeneratorInterface) public typeToGenerator;

    /// @dev Setup payment splitter
    constructor(
        address[] memory payees,
        uint[] memory shares
    ) 
        PaymentSplitter(payees, shares) {
    }

    /// @dev Update generator address
    function updateGenerator(
        uint32 typeOfNFT,
        address generatorAddr
    ) external onlyOwner {
        typeToGenerator[typeOfNFT] = GeneratorInterface(generatorAddr);
    }

    /// @notice Get user-issued contract address list
    function getContractList() external view returns (address[] memory) {
        return userContracts[_msgSender()];
    }
}
