// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "dialog\player_sys.sqf";
if(dialog) exitwith{};

disableSerialization;

private["_Dialog","_foodtext","_watertext","_mvalue","_rogue"];

_playerDialog = createDialog "playerSettings";

_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_groupButton = _Dialog displayCtrl groupButton;
_foodtext ctrlSettext format["%1 / 100", round(hungerLevel)];
_watertext ctrlSetText format["%1 / 100", round(thirstLevel)];


[] spawn
{
	disableSerialization;
	_dialog = findDisplay playersys_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};
