// SPDX-License-Identifier: Apache-2.0

/******************************************************************************
 * Copyright 2020 IEXEC BLOCKCHAIN TECH                                       *
 *                                                                            *
 * Licensed under the Apache License, Version 2.0 (the "License");            *
 * you may not use this file except in compliance with the License.           *
 * You may obtain a copy of the License at                                    *
 *                                                                            *
 *     http://www.apache.org/licenses/LICENSE-2.0                             *
 *                                                                            *
 * Unless required by applicable law or agreed to in writing, software        *
 * distributed under the License is distributed on an "AS IS" BASIS,          *
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   *
 * See the License for the specific language governing permissions and        *
 * limitations under the License.                                             *
 ******************************************************************************/

pragma solidity >0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "@iexec/poco/contracts/IexecInterfaceToken.sol";


contract WithIexecToken
{
	address internal constant IEXECPROXY = 0x3eca1B216A7DF1C7689aEb259fFB83ADFB894E7f;

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
