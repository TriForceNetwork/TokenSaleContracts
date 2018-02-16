pragma solidity ^0.4.18;

import '../token/DataCentre.sol';
import '../Pausable.sol';


contract DataManager is Pausable {

    // satelite contract addresses
    address public dataCentreAddr;

    function DataManager(address _dataCentreAddr) {
        dataCentreAddr = _dataCentreAddr;
    }

    // Constant Functions
    function balanceOf(address _owner) public constant returns (uint256) {
        return DataCentre(dataCentreAddr).getBalanace("TRI", _owner);
    }

    function totalSupply() public constant returns (uint256) {
        return DataCentre(dataCentreAddr).getValue("TRI", "totalSupply");
    }

    function allowance(address _owner, address _spender) public constant returns (uint256) {
        return DataCentre(dataCentreAddr).getConstraint("TRI", _owner, _spender);
    }

    function _setTotalSupply(uint256 _newTotalSupply) internal {
        DataCentre(dataCentreAddr).setValue("TRI", "totalSupply", _newTotalSupply);
    }

    function _setBalanceOf(address _owner, uint256 _newValue) internal {
        DataCentre(dataCentreAddr).setBalanace("TRI", _owner, _newValue);
    }

    function _setAllowance(address _owner, address _spender, uint256 _newValue) internal {
        require(balanceOf(_owner) >= _newValue);
        DataCentre(dataCentreAddr).setConstraint("TRI", _owner, _spender, _newValue);
    }

}
