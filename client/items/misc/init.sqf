// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Initialize Miscellaneous Items
//@file Argument: the path of the directory holding this file
_path = _this;

MF_ITEMS_REPAIR_KIT_RANGE = 5;


MF_ITEMS_REPAIR_KIT = "repairkit";
_repair = [_path, "repair.sqf"] call mf_compile;
_icon = "client\icons\repair.paa";

mf_nearest_vehicle = {
	private ["_types", "_obj", "_dist"];
	_types = _this;
	_obj = cursorTarget;
	if (!isNull _obj && {{_obj isKindOf _x} count _types == 0}) then { _obj = objNull };
	_obj
} call mf_compile;

mf_repair_nearest_vehicle = {
	["LandVehicle", "Air", "Ship"] call mf_nearest_vehicle
} call mf_compile;

// Setting up repairing action.
/*mf_repair_can_repair = [_path, "can_repair.sqf"] call mf_compile;
private ["_label1", "_execute1", "_condition1", "_action1"];
_label1 = format["<img image='%1'/> Repair Vehicle", _icon];
_condition1 = "[] call mf_repair_can_repair == ''";
_action1 = [_label1, _execute1, [], 1, false, false, "", _condition1];
["repairkit-use", _action1] call mf_player_actions_set;/
