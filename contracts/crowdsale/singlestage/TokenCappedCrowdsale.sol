pragma solidity ^0.4.11;

import './Crowdsale.sol';

/**
 * @title TokenCappedCrowdsale
 * @dev Extension of Crowdsale with a max amount of tokens to be bought
 */
contract TokenCappedCrowdsale is Crowdsale {

  uint256 public tokenCap;
  uint256 public totalSupply;

  function TokenCappedCrowdsale(uint256 _tokenCap) public {
      require(_tokenCap > 0);
      tokenCap = _tokenCap;
  }

  function setSupply(uint256 newSupply) internal constant returns (bool) {
    totalSupply = newSupply;
    return tokenCap >= totalSupply;
  }

}
