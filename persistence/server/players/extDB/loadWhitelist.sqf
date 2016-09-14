// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadAccount.sqf
//	@file Author: Torndeco, AgentRev

if (!isServer) exitWith {};

params ["_UID", "_player"];
private ["_result", "_data", "_location", "_dataTemp", "_ghostingTimer", "_secs", "_columns", "_pvar", "_pvarG"];


//First check the whitelist
private _whitelisted = [["checkPlayerWhitelist", _UID]] call extDB_Database_async;

diag_log format ["loadWhitelist %1: %2", _uid, _whitelisted];

_whitelisted