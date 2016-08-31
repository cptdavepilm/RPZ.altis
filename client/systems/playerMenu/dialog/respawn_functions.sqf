// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: respawn_functions.sqf
//	@file Author: AgentRev

_getPlayersInfo =
{
	private ["_location"];
	_location = _this; //town marker name

	_friendlyUnits = [];
	_friendlyPlayers = 0;
	_friendlyNPCs = 0;
	_enemyPlayers = 0;
	_enemyNPCs = 0;

	
	_friendlyUnits = missionNamespace getVariable [format ["%1_friendlyUnits", _location], []];
	_friendlyPlayers = missionNamespace getVariable [format ["%1_friendlyPlayers", _location], 0];
	_friendlyNPCs = missionNamespace getVariable [format ["%1_friendlyNPCs", _location], 0];
	_enemyPlayers = missionNamespace getVariable [format ["%1_enemyPlayers", _location], 0];
	_enemyNPCs = missionNamespace getVariable [format ["%1_enemyNPCs", _location], 0];
};
