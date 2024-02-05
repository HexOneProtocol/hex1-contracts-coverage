// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./mocks/ReliquaryEchidna.sol";
import "../../src/HexitToken.sol";
import "../../src/HexitToken.sol";
import "../../src/HexitToken.sol";
import "../../src/HexitToken.sol";
import "../../src/HexitToken.sol";
import "./mocks/ERC20Mock.sol";

// example : https://github.com/beirao/Reliquary/blob/echidna/echidna/ReliquaryProperties.sol

//? How to simulate a user call
// (bool success, bytes memory data) = user.proxy(
//     address(reliquary),
//     abi.encodeWithSelector(
//         reliquary.createRelicAndDeposit.selector,
//         address(user),
//         poolId,
//         amount
//     )
// );
// assert(success);
contract User {
    function proxy(address target, bytes memory data) public returns (bool success, bytes memory err) {
        return target.call(data);
    }

    function approveERC20(ERC20 target, address spender) public {
        target.approve(spender, type(uint256).max);
    }
}

contract HexOneProperties {
    uint256 public totalNbUsers;
    User[] public users;

    constructor() payable {
        // config -----------
        totalNbUsers = 10; // fix
        // ------------------

        /// setup HexOne

        /// setup users
        // admin is this contract
        // user
        for (uint256 i = 0; i < totalNbUsers; i++) {
            User user = new User();
            users.push(user);
        }
    }

    // --------------------- State updates --------------------- (Here we will be defining all state update functions)

    /// random deposit
    function randDeposit(uint256 randUser, uint256 randAmount, uint256 randDuration) public {}

    // ---------------------- Invariants ---------------------- (Here we will be defining all our invariants)

    /// @custom:invariant - HEXIT token emmission should never be more than the max emission.
    function hexitEmissionIntegrity() public {}

    // ---------------------- Helpers ------------------------- (Free area to define helper functions)
}
