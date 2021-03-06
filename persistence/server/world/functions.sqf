// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: functions.sqf
//	@file Author: AgentRev

#define STICKY_CHARGE_DUMMY_OBJ "Sign_Sphere10cm_F"

private ["_baseSavingOn", "_boxSavingOn", "_staticWeaponSavingOn", "_timeSavingOn", "_weatherSavingOn", "_savingMethod", "_isBox", "_isStaticWeapon", "_isSaveable", "_strToSide", "_hcProfileVarName", "_hcSaveProfileVar"];

_baseSavingOn = ["A3W_baseSaving"] call isConfigOn;
_boxSavingOn = ["A3W_boxSaving"] call isConfigOn;
_staticWeaponSavingOn = ["A3W_staticWeaponSaving"] call isConfigOn;
_timeSavingOn = ["A3W_timeSaving"] call isConfigOn;
_weatherSavingOn = ["A3W_weatherSaving"] call isConfigOn;

_savingMethod = call A3W_savingMethod;

_isBox = { _this isKindOf "ReammoBox_F" };
_isStaticWeapon = { _this isKindOf "StaticWeapon" };

_isSaveable = { (toLower _this) in A3W_saveableObjects };

_strToSide =
{
	switch (toUpper _this) do
	{
		case "WEST":  { BLUFOR };
		case "EAST":  { OPFOR };
		case "GUER":  { INDEPENDENT };
		case "CIV":   { CIVILIAN };
		case "LOGIC": { sideLogic };
		default       { sideUnknown };
	};
};

_hcProfileVarName =
{
	private "_midName";

	if (_savingMethod == "extDB") then
	{
		_midName = format ["extDB_Server%1_", call A3W_extDB_ServerID];
	};

	if (_savingMethod == "profile") then
	{
		_midName = ["PDB_ObjectFileID", "A3W_"] call getPublicVar;
	};

	if (!isNil "_midName") then { "A3W_hcSaving_" + _midName + _this } else { nil }
};

_hcSaveProfileVar =
{
	_varName = _this call _hcProfileVarName;

	if (!isNil "_varName") then
	{
		profileNamespace setVariable [_varName, missionNamespace getVariable _this];
		saveProfileNamespace;
	};
};
