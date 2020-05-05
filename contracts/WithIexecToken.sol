pragma solidity >0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "@iexec/poco/contracts/IexecInterfaceToken.sol";


contract WithIexecToken
{
	address constant IEXECPROXY = 0x3eca1B216A7DF1C7689aEb259fFB83ADFB894E7f;

	IexecInterfaceToken public iexecproxy;

	constructor(address _iexecproxy)
	public
	{
		if      (_isContract(_iexecproxy)) { iexecproxy = IexecInterfaceToken(payable(_iexecproxy)); }
		else if (_isContract(IEXECPROXY )) { iexecproxy = IexecInterfaceToken(payable(IEXECPROXY )); }
		else                               { revert("invalid-iexecproxy-address");                   }
	}

	function _isContract(address _addr)
	internal view returns (bool)
	{
		uint32 size;
		assembly { size := extcodesize(_addr) }
		return size > 0;
	}
}
