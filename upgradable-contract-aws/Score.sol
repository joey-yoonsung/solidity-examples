pragma solidity ^0.5.0;

contract Score is ProxyStorage, ScoreStorage { 
    constructor () public payable {}
    function setScore(uint256 _score) public {
        score = _score;
    }
    function () external payable{}
}
