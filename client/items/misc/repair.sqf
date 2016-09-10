// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: repair.sqf
//@file Author: MercyfulFate
//@file Created: 23/7/2013 16:00
//@file Description: Repair the nearest Vehicle

#define DURATION 20
#define REPAIR_RANGE 6;
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_VEHICLE "You are not close enough to a vehicle that needs repairing"
#define ERR_IN_VEHICLE "Repairing Failed! You can't do that in a vehicle"
#define ERR_FULL_HEALTH "Repairing Failed! The vehicle is already repaired"
#define ERR_DESTROYED "The vehicle is too damaged to repair"
#define ERR_TOO_FAR_AWAY "Repairing failed! You moved too far away from the vehicle"
#define ERR_CANCELLED "Repairing cancelled!"

private ["_vehicle", "_hitPoints", "_checks", "_success"];
_vehicle = _this select 0;
_hitpoint = _this select 1;
_part = _this select 2;

_checks = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_vehicle = _this select 1;
	diag_log format ["repair.sqf %1, %2", _vehicle, player distance _vehicle];
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _vehicle >  4): {_text = ERR_TOO_FAR_AWAY};
		case (!alive _vehicle): {_text = ERR_DESTROYED};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Repairing %1%2 Complete", round(100 * _progress), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;

if (_success) then {
	[netId _vehicle, _hitpoint] remoteExec ["mf_remote_repair", _vehicle];
	["Repairing complete!", 5] call mf_notify_client;

	player removeItem _part;
};
_success;
