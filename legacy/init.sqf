DZS_JIP = if (time > 0) then { true } else { false };  
fnDone = false;
[] execVM "mission\functions.sqf";

waitUntil {fnDone};
CVG_Debug = true;
CVG_Horde = false;
[] call DZS_fn_parseLoot;
[] execVM "mission\CZinit.sqf";
[] execVM  "zombie_scripts\zombiesinit.sqf";
[] exec "zombie_scripts\zombiesinit.sqs";

