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
#define hud_food_border_idc 3604
#define hud_blood_border_idc 3605
#define hud_thirst_border_idc 3606
#define hud_food_inside_idc 3607
#define hud_blood_inside_idc 3608
#define hud_thirst_inside_idc 3609

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
	sleep 0.1;

	if (isNull _ui) then
	{
		1000 cutRsc ["WastelandHud","PLAIN"];
		_ui = uiNamespace getVariable ["WastelandHud", displayNull];
	};


	_flash = {
	if (ctrlShown _this) then {
			_this ctrlShow false;
		} else {
			_this ctrlShow true;
		};
	};

	_healthTextColor = "#60A042";
	
	//Calculate Health 0 - 100
	_blood = ((1 - damage player)) max 0;
	_food = ceil (hungerLevel max 0) / 100.0;
	_thirst = ceil (thirstLevel max 0) / 100.0;

	_bloodLvl = 6 min (0 max (round(6.0*(_blood))));
	_thirstLvl = 6 min (0 max (round(6.0*(_food))));
	_hungerLvl = 6 min (0 max (round(6.0*(_thirst)));

	_hudVehicle = _ui displayCtrl hud_vehicle_idc;
	_hudActivityIcon = _ui displayCtrl hud_activity_icon_idc;
	_hudActivityTextbox = _ui displayCtrl hud_activity_textbox_idc;

	//Controls
	_hudFoodBorder = _ui displayCtrl hud_food_border_idc;
	_hudFoodInside = _ui displayCtrl hud_food_inside_idc;
	_hudBloodBorder = _ui displayCtrl hud_blood_border_idc;
	_hudBloodInside = _ui displayCtrl hud_blood_inside_idc;
	_hudThirstBorder = _ui displayCtrl hud_thirst_border_idc;
	_hudThirstInside = _ui displayCtrl hud_thirst_inside_idc;

	_hudFoodBorder ctrlSetTextColor [1,1,1,1];
	_hudBloodBorder ctrlSetTextColor [1,1,1,1];
	_hudThirstBorder ctrlSetTextColor [1,1,1,1];

	GUI_R = 0.38; // 0.7 .38
	GUI_G = 0.63; // -0.63
	GUI_B = 0.26; // -0.26

	_hudFoodInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_blood))),(GUI_G * _blood),(GUI_B * _blood), 1];
	_hudBloodInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_food))),(GUI_G * _food),(GUI_B * _food), 1];
	_hudThirstInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_thirst))),(GUI_G * _thirst),(GUI_B * _thirst), 1];

	// Icons in bottom right
	_bloodborderText = "\awaken_medical\gui\status\status_blood_border_CA.paa";
	_hudFoodBorder ctrlSetText _bloodborderText;

	if (_bloodLvl < 0) then { _bloodLvl = 0 };
	_bloodInnerText = "\awaken_medical\gui\status\status_blood_inside_" + str(_bloodLvl) + "_ca.paa";

	if (_thirstLvl < 0) then { _thirstLvl = 0 };
	_thirstInnerText = "\awaken_medical\gui\status\status_thirst_inside_" + str(_thirstLvl) + "_ca.paa";

	if (_foodLvl < 0) then { _foodLvl = 0 };
	_foodInnerText = "\awaken_medical\gui\status\status_food_inside_" + str(_foodLvl) + "_ca.paa";

	_hudBloodInside ctrlSetText _bloodInnerText;
	_hudThirstInside ctrlSetText _thirstInnerText;
	_hudFoodInside ctrlSetText _foodInnerText;


	//  Flashing
	if (_blood < 0.2) then {
		_hudBloodInside call _flash;
	} else {
		if (!ctrlShown _hudBloodInside) then {
			_hudBloodInside ctrlShow true;
		};
	};

	if (_thirst < 0.2) then {
		_hudThirstInside call _flash;
	} else {
		if (!ctrlShown _hudThirstInside) then {
			_hudThirstInside ctrlShow true;
		};
	};

	if (_food < 0.2) then {
		_hudFoodInside call _flash;
	} else {
		if (!ctrlShown _hudFoodInside) then {
			_hudFoodInside ctrlShow true;
		};
	};


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
