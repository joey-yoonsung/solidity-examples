pragma solidity ^0.5.0;

contract ScoreV2 is ProxyStorage, ScoreStorage {
    constructor () public payable {}
    function setScore(uint256 _score) public {
        score = _score + 1;
    }
    function () external payable{}
}
