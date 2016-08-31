// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19

#include "respawn_defines.hpp"

// Check if both players are on the same side, and that our player is BLUFOR or OPFOR, or that both are in the same group
#define FRIENDLY_CONDITION ([_x, player] call A3W_fnc_isFriendly)
#define DISABLE_ALL_BUTTONS format ["{ ctrlEnable [_x, false] } forEach %1;", [respawn_Random_Button, respawn_Spawn_Button, respawn_Locations_Type, respawn_Locations_List, respawn_Preload_Checkbox, respawn_GroupMgmt_Button]]
#define TOWN_SPAWN_COOLDOWN (["A3W_townSpawnCooldown", 5*60] call getPublicVar)

disableSerialization;
waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable ["RespawnSelectionDialog", displayNull];
_display displayAddEventHandler ["KeyDown", "(respawnDialogActive && _this select 1 == 1)"];
_respawnText = _display displayCtrl respawn_Content_Text;
_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;

_randomButton = _display displayCtrl respawn_Random_Button;
//_townsButton = _display displayCtrl respawn_LoadTowns_Button;
_spawnButton = _display displayCtrl respawn_Spawn_Button;
_spawnButton ctrlEnable false;
ctrlSetFocus _randomButton;

_spawnButton ctrlSetText "Loading...";

_locType = _display displayCtrl respawn_Locations_Type;
_locList = _display displayCtrl respawn_Locations_List;
_locMap = _display displayCtrl respawn_Locations_Map;

_townSpawnCooldown = TOWN_SPAWN_COOLDOWN;

_side = switch (playerSide) do
{
	case BLUFOR: { "BLUFOR" };
	case OPFOR:  { "OPFOR" };
	default      { "Independent" };
};

_respawnText ctrlSetStructuredText parseText (format ["Welcome to AwakenRP<br/>You are on %1. Please select a spawn point.", _side]);
respawnDialogActive = true;

//buttonSetAction [respawn_Random_Button, format ["%1 [%2,0] execVM 'client\functions\spawnAction.sqf'", _disableAllButtons, respawn_Random_Button]];
_randomButton buttonSetAction format ["%1 [%2,[0,nil]] execVM 'client\functions\spawnAction.sqf'", DISABLE_ALL_BUTTONS, respawn_Random_Button];
(_display displayCtrl respawn_Preload_Checkbox) cbSetChecked (profileNamespace getVariable ["A3W_preloadSpawn", true]);

#include "respawn_functions.sqf"

_setPlayersInfo =
{
	private ["_location", "_maxRad", "_centerPos", "_maxRad", "_townEntry"];

	_location = _this; //town marker name
	_maxRad = 0;
	_friendlyUnits = [];
	_friendlyPlayers = 0;
	_friendlyNPCs = 0;
	_enemyPlayers = 0;
	_enemyNPCs = 0;


	_centerPos = markerPos _location;
	{
		if (_x select 0 == _location) exitWith
		{
			_maxRad = _x select 1;
		};
	} forEach (call cityList);

	{
		if (alive _x && {_x isKindOf "CAManBase" && {!(_x call A3W_fnc_isUnconscious) && _x distance _centerPos <= _maxRad}}) then
		{
			if (FRIENDLY_CONDITION) then
			{
				if (isPlayer _x) then
				{
					_friendlyPlayers = _friendlyPlayers + 1;
					_friendlyUnits pushBack _x;
				}
				else
				{
					_friendlyNPCs = _friendlyNPCs + 1;
				};
			}
			else
			{
				if (isPlayer _x) then
				{
					_enemyPlayers = _enemyPlayers + 1;
				}
				else
				{
					if (side _x != sideLogic) then
					{
						_enemyNPCs = _enemyNPCs + 1;
					};
				};
			};
		};
	} forEach allUnits;


	missionNamespace setVariable [format ["%1_friendlyUnits", _location], _friendlyUnits];
	missionNamespace setVariable [format ["%1_friendlyPlayers", _location], _friendlyPlayers];
	missionNamespace setVariable [format ["%1_friendlyNPCs", _location], _friendlyNPCs];
	missionNamespace setVariable [format ["%1_enemyPlayers", _location], _enemyPlayers];
	missionNamespace setVariable [format ["%1_enemyNPCs", _location], _enemyNPCs];
};

// Function to determine the player thresold for use by BIS_fnc_sortBy (friendly = +100, enemy = -1)
_getPlayerThreshold =
{
	private ["_friendlyPlayers", "_friendlyNPCs", "_enemyPlayers", "_enemyNPCs"];
	_this call _getPlayersInfo;

	((_friendlyPlayers + _friendlyNPCs) * 100 - (_enemyPlayers + _enemyNPCs) + (if (typeName _this != "OBJECT" && _enemyPlayers > _friendlyPlayers) then { -99999 } else { 0 }))
};

_selLocChanged =
{
	disableSerialization;
	private ["_location", "_textStr"];

	_locList = _this select 0;
	_curSel = _this select 1;
	_selText = _locList lbText _curSel;

	_display = ctrlParent _locList;
	_locMap = _display displayCtrl respawn_Locations_Map;
	_locText = _display displayCtrl respawn_Locations_Text;
	_randomBtn = _display displayCtrl respawn_Random_Button;
	_spawnBtn = _display displayCtrl respawn_Spawn_Button;
	_spawnBtnEnabled = false;
	_spawnBtnAction = "";
	_textStr = "";

	#include "respawn_functions.sqf"

	_selData = _locList lbData lbCurSel _locList;

	if (_selData != "") then
	{
		_location = call compile _selData;
	};

	if (!isNil "_location") then
	{
		private ["_friendlyUnits", "_friendlyPlayers", "_enemyPlayers", "_enemyNPCs"];
		_isValid = false;


		if (_location != "") then
		{
			_isValid = true;
			_location call _getPlayersInfo;
			_lastSpawn = player getVariable (_location + "_lastSpawn");
			_cooldown = false;

			if (!isNil "_lastSpawn") then
			{
				_townSpawnCooldown = TOWN_SPAWN_COOLDOWN;
				_remaining = _townSpawnCooldown - (diag_tickTime - _lastSpawn);

				if (_townSpawnCooldown > 0 && _remaining > 0) then
				{
					_textStr = _textStr + format ["[<t color='#ffff00'>%1</t>] ", _remaining call fn_formatTimer];
					_cooldown = true;
				};
			};

			if (_enemyPlayers > _friendlyPlayers) then
			{
				_textStr = _textStr + "[<t color='#ff0000'>Blocked by enemy</t>] ";
			}
			else
			{
				_spawnBtnEnabled = !_cooldown;
			};
		};

		if (_isValid) then
		{
			_extraTextStr = "";

			if (_friendlyPlayers > 0) then
			{
				if (_extraTextStr != "") then { _extraTextStr = _extraTextStr + ", " };
				_extraTextStr = _extraTextStr + format ["<t color='#00ff00'>%1 friendly player(s)</t>", _friendlyPlayers];
			};

			if (_enemyPlayers > 0) then
			{
				if (_extraTextStr != "") then { _extraTextStr = _extraTextStr + ", " };
				_extraTextStr = _extraTextStr + format ["<t color='#ff0000'>%1 enemy player(s)</t>", _enemyPlayers];
			};

			if (_enemyNPCs > 0) then
			{
				if (_extraTextStr != "") then { _extraTextStr = _extraTextStr + ", " };
				_extraTextStr = _extraTextStr + format ["<t color='#ff0000'>%1 enemy AI(s)</t>", _enemyNPCs];
			};

			_textStr = _textStr + _extraTextStr;

			private ["_data", "_pos"];

			_pos = markerPos _location;
			_data = [1, _location];

			_spawnBtnAction = format ["%1 %2 execVM 'client\functions\spawnAction.sqf'", DISABLE_ALL_BUTTONS, [respawn_Spawn_Button, _data]];

			if (uiNamespace getVariable ["RespawnSelectionDialog_lastSelLoc", ""] != _selData) then
			{
				ctrlMapAnimClear _locMap;
				_locMap ctrlMapAnimAdd [0.25, ctrlMapScale _locMap, _pos];
				ctrlMapAnimCommit _locMap;
			};

			uiNamespace setVariable ["RespawnSelectionDialog_selLocPos", _pos];
		}
		else
		{
			uiNamespace setVariable ["RespawnSelectionDialog_selLocPos", nil];
		};
	}
	else
	{
		uiNamespace setVariable ["RespawnSelectionDialog_selLocPos", nil];
	};

	if (buttonAction _spawnBtn != _spawnBtnAction) then
	{
		_spawnBtn buttonSetAction _spawnBtnAction;
	};

	_spawnBtnEnabled = _spawnBtnEnabled && ctrlEnabled _randomBtn;

	if ((!ctrlEnabled _spawnBtn && _spawnBtnEnabled) || (ctrlEnabled _spawnBtn && !_spawnBtnEnabled)) then
	{
		_spawnBtn ctrlEnable _spawnBtnEnabled;
	};

	if (ctrlText _locText != _textStr) then
	{
		_locText ctrlSetStructuredText parseText _textStr;
	};

	uiNamespace setVariable ["RespawnSelectionDialog_lastSelLoc", _selData];
};

_locList ctrlAddEventHandler ["LBSelChanged", _selLocChanged];

_locMap ctrlAddEventHandler ["Draw",
{
	_ctrl = _this select 0;


	_spawnLoc = uiNamespace getVariable "RespawnSelectionDialog_selLocPos";

	if (!isNil "_spawnLoc") then
	{
		_ctrl drawIcon ["\A3\ui_f\Data\gui\Rsc\RscDisplayArcadeMap\top_close_gs.paa", [0,1,1,1], _spawnLoc, 31, 35, 0, "", 2];
	};
}];

_locType lbAdd "Towns";
_locType lbSetCurSel 0;

_locType ctrlAddEventHandler ["LBSelChanged",
{
	_locType = _this select 0;
	_curSel = _this select 1;

	_display = ctrlParent _locType;

	_locList = _display displayCtrl respawn_Locations_List;
	lbClear _locList;
	_locList lbSetCurSel -1;

	_spawnButton = _display displayCtrl respawn_Spawn_Button;
	_spawnButton ctrlSetText "Loading...";

	uiNamespace setVariable ["RespawnSelectionDialog_updateLocs", true];
}];

uiNamespace setVariable ["RespawnSelectionDialog_lastSelLoc", nil];
uiNamespace setVariable ["RespawnSelectionDialog_selLocPos", nil];

_oldLocArray = [];
_typeAutoSel = false;

// Separate thread for fast text updating
[_selLocChanged] spawn
{
	disableSerialization;
	_selLocChanged = _this select 0;
	_display = uiNamespace getVariable ["RespawnSelectionDialog", displayNull];
	_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;
	_locList = _display displayCtrl respawn_Locations_List;

	while {!isNull _display} do
	{
		_timeText = [serverTime/60/60] call BIS_fnc_timeToString;
		_missionUptimeText ctrlSetText format ["Mission uptime: %1", _timeText];
		[_locList, lbCurSel _locList] call _selLocChanged;
		uiSleep 0.9;
	};
};

// Main scanning subroutine
while {!isNull _display} do
{
	_time = diag_tickTime;
	//_timeText = [serverTime/60/60] call BIS_fnc_timeToString;
	//_missionUptimeText ctrlSetText format ["Mission uptime: %1", _timeText];

	_locations = [];

	_towns = [];
	{
		private "_friendlyPlayers";
		_town = _x select 0;
		_town call _setPlayersInfo;

		if (_friendlyPlayers > 0) then
		{
			_towns pushBack _town;
		};
	} forEach (call cityList);


	if (!_typeAutoSel && ctrlEnabled _randomButton) then
	{
		if (count _towns > 0) then { _locType lbSetCurSel 0 };
		_typeAutoSel = true;
	};

	[_towns, [], {_x call _getPlayerThreshold}, "DESCEND"] call BIS_fnc_sortBy;

	_newLocArray = []; // Location, Text, Data, Picture, Enabled

	{
		_location = _x;
		_text = "";
		_data = "";

		{
			if (_x select 0 == _location) exitWith
			{
				_text = (_x select 2);
				_data = str _location;
			};
		} forEach (call cityList);

		private ["_friendlyUnits", "_friendlyPlayers", "_enemyPlayers", "_enemyNPCs"];
		_location call _getPlayersInfo;

		private "_picture";
		_enabled = true;

		_lastSpawn = player getVariable (_location + "_lastSpawn");
		_cooldown = false;

		if (!isNil "_lastSpawn") then
		{
			_remaining = _townSpawnCooldown - (diag_tickTime - _lastSpawn);

			if (_townSpawnCooldown > 0 && _remaining > 0) then
			{
				_picture = "\A3\ui_f\Data\gui\Rsc\RscDisplayMultiplayer\sessions_locked_ca.paa";
				_cooldown = true;
			};
		};

		_enabled = (!_cooldown && _enemyPlayers <= _friendlyPlayers);

		if (isNil "_picture") then
		{
			_picture = format ["\A3\ui_f\Data\gui\Rsc\RscDisplayMultiplayer\%1", if (_enabled) then { "sessions_none_ca.paa" } else { "sessions_version_ca.paa" }];
		};

		_newLocArray pushBack [_location, _text, _data, _picture, _enabled];
	} forEach _locations;

	if !(uiNamespace getVariable ["RespawnSelectionDialog_updateLocs", false]) then
	{
		if !(_newLocArray isEqualTo _oldLocArray) then
		{
			private ["_selData", "_selLoc", "_loc", "_idx", "_selIdx"];
			_selData = _locList lbData lbCurSel _locList;

			if (_selData != "") then
			{
				_selLoc = call compile _selData;
			};

			lbClear _locList;

			{
				_loc = _x select 0;
				_idx = _locList lbAdd (_x select 1);
				_locList lbSetData [_idx, _x select 2];
				_locList lbSetPicture [_idx, _x select 3];

				if (isNil "_selIdx" && !isNil "_selLoc" && {typeName _loc == typeName _selLoc && {_loc == _selLoc}}) then
				{
					_selIdx = _idx;
				};
			} forEach _newLocArray;

			if (!isNil "_selIdx") then
			{
				_locList lbSetCurSel _selIdx;
			};
		};

		_spawnButton ctrlSetText "Spawn";
	};

	_oldLocArray = _newLocArray;

	_updateLocs = false;
	waitUntil {_updateLocs = uiNamespace getVariable ["RespawnSelectionDialog_updateLocs", false]; diag_tickTime - _time >= 0.5 || _updateLocs};

	if (_updateLocs) then
	{
		_oldLocArray = [];
		uiNamespace setVariable ["RespawnSelectionDialog_updateLocs", nil];
	};
};
