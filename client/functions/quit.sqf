// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************

diag_log format ["quit.sqf %1",  _this];

_this spawn {
    if (_this) then
    {
        ["You are not whitelisted, visit www.awakenrp.com!", "Not whitelisted", false, false] spawn BIS_fnc_GUImessage;

        sleep 5;
    };

    
    // soft CTD via missing include
    //preprocessFile "client\functions\quit.hpp";

    // BE kick if soft CTD fails
    _dummyVar = "A3W_fnc_antihackLog_" + str floor random 1e6;
    missionNamespace setVariable [_dummyVar, getPlayerUID player];
    publicVariableServer _dummyVar;

    // hard CTD if BE kick fails
    //player setVelocity [0,0,1e38];
};
