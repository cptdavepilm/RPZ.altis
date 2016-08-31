// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS] Bewilderbeest
//	@file Created: 11/09/2012 04:23
//	@file Args:

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

scriptName "playerHud";

disableSerialization;
private ["_lastHealthReading", "_activityIconOrigPos", "_activityTextboxOrigPos", "_dispUnitInfo", "_topLeftBox", "_topLeftBoxPos"];

_lastHealthReading = 100; // Used to flash the health reading when it changes


_survivalSystem = ["A3W_survivalSystem"] call isConfigOn;
_unlimitedStamina = ["A3W_unlimitedStamina"] call isConfigOn;
_disableUavFeed = ["A3W_disableUavFeed"] call isConfigOn;

private ["_mapCtrls", "_mapCtrl"];
_ui = displayNull;

while {true} do
{
	if (isNull _ui) then
	{
		1000 cutRsc ["WastelandHud","PLAIN"];
		_ui = uiNamespace getVariable ["WastelandHud", displayNull];
	};

	_vitals = _ui displayCtrl hud_status_idc;
	_hudVehicle = _ui displayCtrl hud_vehicle_idc;
	_hudActivityIcon = _ui displayCtrl hud_activity_icon_idc;
	_hudActivityTextbox = _ui displayCtrl hud_activity_textbox_idc;

	//Calculate Health 0 - 100
	_health = ((1 - damage player) * 100) max 0;
	_health = if (_health > 1) then { floor _health } else { ceil _health };

	// Flash the health colour on the HUD according to it going up, down or the same
	_healthTextColor = "#FFFFFF";

	if (_health != _lastHealthReading) then
	{
		// Health change. Up or down?
		if (_health < _lastHealthReading) then
		{
			// Gone down. Red flash
			_healthTextColor = "#FF1717";
		}
		else
		{
			// Gone up. Green flash
			_healthTextColor = "#17FF17";
			if (!isNil "BIS_HitCC" && {ppEffectEnabled BIS_HitCC}) then { BIS_HitCC ppEffectEnable false }; // fix for permanent red borders due to fire damage
		};
	};

	// Make sure we keep a record of the health value from this iteration
	_lastHealthReading = _health;

	// Icons in bottom right

	_strArray = [];

	if (_survivalSystem) then {
		_strArray pushBack format ["%1 <img size='0.7' image='client\icons\water.paa'/>", ceil (thirstLevel max 0)];
		_strArray pushBack format ["%1 <img size='0.7' image='client\icons\food.paa'/>", ceil (hungerLevel max 0)];
	};

	if (!_unlimitedStamina) then {
		_strArray pushBack format ["%1 <img size='0.7' image='client\icons\running_man.paa'/>", 100 - ceil ((getFatigue player) * 100)];
	};

	_strArray pushBack format ["<t color='%1'>%2</t> <img size='0.7' image='client\icons\health.paa'/>", _healthTextColor, _health];

	_str = "";

	{ _str = format ["%1%2<br/>", _str, _x] } forEach _strArray;

	_yOffsetVitals = (count _strArray + 1) * 0.04;

	_vitalsPos = ctrlPosition _vitals;
	_vitalsPos set [1, safeZoneY + safeZoneH - _yOffsetVitals]; // x
	_vitalsPos set [3, _yOffsetVitals]; // h

	_vitals ctrlShow alive player;
	_vitals ctrlSetStructuredText parseText _str;
	_vitals ctrlSetPosition _vitalsPos;
	_vitals ctrlCommit 0;

	_tempString = "";
	_yOffset = _yOffsetVitals + 0.04;

	if (isStreamFriendlyUIEnabled) then
	{
		_tempString = format ["<t color='#CCCCCCCC'>A3Wasteland %1<br/>a3wasteland.com</t>", getText (configFile >> "CfgWorlds" >> worldName >> "description")];
		_yOffset = _yOffset + 0.08;
	}
	else
	{
		if (player != vehicle player) then
		{
			_vehicle = vehicle player;

			{
				if (alive _x) then
				{
					_icon = switch (true) do
					{
						case (driver _vehicle == _x): { "client\icons\driver.paa" };
						case (gunner _vehicle == _x): { "client\icons\gunner.paa" };
						default                       { "client\icons\cargo.paa" };
					};

					_tempString = format ["%1 %2 <img image='%3'/><br/>", _tempString, name _x, _icon];
					_yOffset = _yOffset + 0.04;
				};
			} forEach crew _vehicle;
		};
	};

	_hudVehiclePos = ctrlPosition _hudVehicle;
	_hudVehiclePos set [1, safeZoneY + safeZoneH - _yOffset]; // x
	_hudVehiclePos set [3, _yOffset - _yOffsetVitals]; // h

	_hudVehicle ctrlSetStructuredText parseText _tempString;
	_hudVehicle ctrlSetPosition _hudVehiclePos;
	_hudVehicle ctrlCommit 0;

	// Remove unrealistic blur effects
	if (!isNil "BIS_fnc_feedback_damageBlur" && {ppEffectCommitted BIS_fnc_feedback_damageBlur}) then { ppEffectDestroy BIS_fnc_feedback_damageBlur };
	if (!isNil "BIS_fnc_feedback_fatigueBlur" && {ppEffectCommitted BIS_fnc_feedback_fatigueBlur}) then { ppEffectDestroy BIS_fnc_feedback_fatigueBlur };

	// Voice monitoring
	[false] call fn_voiceChatControl;

	if (isNil "_mapCtrls") then
	{
		_mapCtrls =
		[
			[{(uiNamespace getVariable ["RscDisplayAVTerminal", displayNull]) displayCtrl 51}, controlNull]/*, // UAV Terminal
			[{artilleryComputerDisplayGoesHere displayCtrl 500}, controlNull]*/  // Artillery computer - cannot be enabled until this issue is resolved: http://feedback.arma3.com/view.php?id=21546
		];
	};

	if (!isNil "A3W_mapDraw_eventCode") then
	{
		// Add custom markers and lines to misc map controls
		{
			if (isNull (_x select 1)) then
			{
				_mapCtrl = call (_x select 0);

				if (!isNull _mapCtrl) then
				{
					_mapCtrl ctrlAddEventHandler ["Draw", A3W_mapDraw_eventCode];
					_x set [1, _mapCtrl];
				};
			};
		} forEach _mapCtrls;
	};

	// Improve revealing and aimlocking of targetted vehicles
	{
		if (!isNull _x) then
		{
			if ((group player) knowsAbout _x < 4) then
			{
				(group player) reveal [_x, 4];
			};
		};
	} forEach [cursorTarget, cursorObject];

	if (_disableUavFeed && shownUavFeed) then
	{
		showUavFeed false;
	};

	if (isNil "A3W_missingMarkersNotice" && visibleMap) then
	{
		_cbMarkerColors = findDisplay 12 displayCtrl 1090;

		if (!isNull _cbMarkerColors && !ctrlEnabled _cbMarkerColors) then
		{
			[parseText (
			[
				"It appears you are affected by the missing markers bug from the apex and dev branches. In order to solve the problem temporarily, try the following:<br/>",
				" 1. Go back to main menu",
				" 2. Open the editor on Tanoa",
				" 3. Press ""Play Scenario"" in the bottom right",
				" 4. Once loaded, leave the editor and join back the server<br/>",
				"If that doesn't work, try again. If it still doesn't work, restart your game and keep trying again.<br/>",
				"Bohemia are investigating the bug."
			]
			joinString "<br/>"),"Notice"] spawn BIS_fnc_guiMessage;

			A3W_missingMarkersNotice = true;
		};
	};

	enableEnvironment true;
	uiSleep 1;
};
