pragma solidity ^0.5.0;

contract Proxy is ProxyStorage {
    constructor(address payable _impl) public {
        implementation = _impl;
    }

    function setImplementation(address payable _impl) public {
        implementation = _impl;
    }

    function getScore() public view returns (uint256) {
        return ScoreStorage(implementation).score();
    }

    function () external {
        address payable localImpl = implementation;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, localImpl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)
            switch result
                case 0 { revert(ptr, size) }
                default { return(ptr, size) }
        }
    }
}
