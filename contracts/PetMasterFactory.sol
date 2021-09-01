// SPDX-License-Identifier: MIT

pragma solidity =0.8.0;

import 'openzeppelin-solidity/contracts/access/Ownable.sol';
import './PetMaster.sol';

contract PetMasterFactory is Ownable {
    event PetMasterCreated(address indexed petMaster);

    constructor() public {}

    function createPetMaster(
        address _token,
        uint256 _startBlock,
        uint256 _tokenPerBlock,
        uint256 _maxTokenPerBlock,
        uint256 _totalToBeMintAmount
    ) external onlyOwner returns (address) {
        PetMaster petMaster = new PetMaster(
            _token,
            _startBlock,
            _tokenPerBlock,
            _maxTokenPerBlock,
            _totalToBeMintAmount
        );
        Ownable(address(petMaster)).transferOwnership(_msgSender());
        emit PetMasterCreated(address(petMaster));
        return address(petMaster);
    }
}