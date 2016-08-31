// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

diag_log format ["Can i wear this? %1", _player isUniformAllowed _uniform];
if (_uniform != "") then { _player addUniform _uniform };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
//_player linkItem "NVGoggles";

//_player addBackpack "B_AssaultPack_rgr";

_player addMagazine "9Rnd_45ACP_Mag";
_player addWeapon "hgun_ACPC2_F";
_player addMagazine "9Rnd_45ACP_Mag";
_player addMagazine "9Rnd_45ACP_Mag";
_player addMagazine "9Rnd_45ACP_Mag";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_ACPC2_F";

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
