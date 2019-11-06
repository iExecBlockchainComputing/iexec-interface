pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./IexecHub.sol";
import "./IexecClerk.sol";


contract IexecInterface
{
	address constant IEXEC_HUB_MAINNET   = 0x1383c16c927c4A853684d1a9c676986f25E22111;
	address constant IEXEC_HUB_ROPSTEN   = 0xDbe30645EA7d216c31D09f8c5736FE74de774e63;
	address constant IEXEC_HUB_RINKEBY   = 0x0000000000000000000000000000000000000000;
	address constant IEXEC_HUB_KOVAN     = 0xb3901d04CF645747b99DBbe8f2eE9cb41A89CeBF;
	address constant IEXEC_HUB_GOERLI    = 0x99d8717A84d1E97422d04d9a2a82694038470753;
	address constant IEXEC_HUB_BELLECOUR = 0x0000000000000000000000000000000000000000;
	address constant IEXEC_HUB_VIVIANI   = 0x4735e4BC6B143099fDF14224a82429aA34ba4d04;

	IexecHub   public iexecHub;
	IexecClerk public iexecClerk;

	constructor(address _iexecHubAddr)
	public
	{
		if      (_getCodeSize(_iexecHubAddr      ) > 0) { iexecHub = IexecHub(_iexecHubAddr      ); }
		else if (_getCodeSize(IEXEC_HUB_MAINNET  ) > 0) { iexecHub = IexecHub(IEXEC_HUB_MAINNET  ); }
		else if (_getCodeSize(IEXEC_HUB_ROPSTEN  ) > 0) { iexecHub = IexecHub(IEXEC_HUB_ROPSTEN  ); }
		else if (_getCodeSize(IEXEC_HUB_RINKEBY  ) > 0) { iexecHub = IexecHub(IEXEC_HUB_RINKEBY  ); }
		else if (_getCodeSize(IEXEC_HUB_KOVAN    ) > 0) { iexecHub = IexecHub(IEXEC_HUB_KOVAN    ); }
		else if (_getCodeSize(IEXEC_HUB_GOERLI   ) > 0) { iexecHub = IexecHub(IEXEC_HUB_GOERLI   ); }
		else if (_getCodeSize(IEXEC_HUB_BELLECOUR) > 0) { iexecHub = IexecHub(IEXEC_HUB_BELLECOUR); }
		else if (_getCodeSize(IEXEC_HUB_VIVIANI  ) > 0) { iexecHub = IexecHub(IEXEC_HUB_VIVIANI  ); }
		else                                            { revert("invalid-hub-address");            }
		iexecClerk = IexecClerk(iexecHub.iexecclerk());
	}

	function _getCodeSize(address _addr)
	internal view returns (uint _size)
	{
		assembly { _size := extcodesize(_addr) }
	}
}
