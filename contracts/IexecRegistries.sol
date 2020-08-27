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

import "@openzeppelin/contracts/token/ERC721/IERC721Enumerable.sol";
import "@iexec/poco/contracts/registries/IRegistry.sol";


interface IRegistryEntry
{
	function owner()                           external view returns (address);
	function registry()                        external view returns (address);
	function setName(address, string calldata) external;
}

interface IApp is IRegistryEntry
{
	function m_appName()      external view returns (string memory);
	function m_appType()      external view returns (string memory);
	function m_appMultiaddr() external view returns (bytes  memory);
	function m_appChecksum()  external view returns (bytes32);
	function m_appMREnclave() external view returns (bytes  memory);
}

interface IDataset is IRegistryEntry
{
	function m_datasetName()      external view returns (string memory);
	function m_datasetMultiaddr() external view returns (bytes  memory);
	function m_datasetChecksum()  external view returns (bytes32);
}

interface IWorkerpool is IRegistryEntry
{
	event PolicyUpdate(
		uint256 oldWorkerStakeRatioPolicy,
		uint256 newWorkerStakeRatioPolicy,
		uint256 oldSchedulerRewardRatioPolicy,
		uint256 newSchedulerRewardRatioPolicy);

	function m_workerpoolDescription()      external view returns (string memory);
	function m_workerStakeRatioPolicy()     external view returns (uint256);
	function m_schedulerRewardRatioPolicy() external view returns (uint256);

	function changePolicy(
		uint256 _newWorkerStakeRatioPolicy,
		uint256 _newSchedulerRewardRatioPolicy)
	external;
}

abstract contract IAppRegistry is IRegistry
{
	function createApp(address, string calldata, string calldata, bytes calldata, bytes32, bytes calldata)
	external virtual returns (IApp);
}

abstract contract IDatasetRegistry is IRegistry
{
	function createDataset(address, string calldata, bytes calldata, bytes32)
	external virtual returns (IDataset);
}

abstract contract IWorkerpoolRegistry is IRegistry
{
	function createWorkerpool(address, string calldata)
	external virtual returns (IWorkerpool);
}
