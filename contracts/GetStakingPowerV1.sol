// SPDX-License-Identifier: MIT

pragma solidity =0.6.6;

import './IGetStakingPower.sol';

contract DefaultGetStakingPowerV1 is IGetStakingPower {
    constructor() public {}

    function getStakingPower(
        address, /* _erc721 */
        uint256 /* _tokenId */
    ) external view override returns (uint256) {
        return 1E18; // assume PET has 1 power
    }
}