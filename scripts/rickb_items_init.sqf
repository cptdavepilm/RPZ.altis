//	@file Version: 1.1
//	@file Name: rickb_items_init.sqf
//	@file Author: rickb
//	@file Description: rickb items init

private ["_unit","_item"];

if (isdedicated) exitwith {};

//_unit = _this select 0;

handle = [] spawn {    
    fnc_dbl ={
        
        _this spawn {    
            _idc = ctrlIDC (_this select 0);          
            _selectedIndex = _this select 1;         
            _unit = player;
            _item = lbData [_idc, _selectedIndex];

            _isMag = isClass( configFile >> "cfgMagazines" >> _item );
            _isClickAble = false;

            _action = "";
            _consume = false;
            _give = "";

            if (_isMag) then
            {
                _isClickAble = isClass( configFile >> "cfgMagazines" >> _item >> "ItemFunctions");

                if (_isClickAble) then
                {
                    _action = getText ( configFile >> "cfgMagazines" >> _item >> "ItemFunctions" >> "action");
                    _consume = (getNumber ( configFile >> "cfgMagazines" >> _item >> "ItemFunctions" >> "consume") == 1);
                    _giveConf = (configFile >> "cfgMagazines" >> _item >> "ItemFunctions" >> "give");

                    if (isText(_giveConf)) then
                    {
                        _give = getText(_giveConf);
                    };

                    diag_log format ["ihatethis %1, %2, %3", _action, _consume,_give];
                };
            };

            if (_isClickAble) then
            {
                awaken_useitem_result = false;
                awaken_tet = 0 spawn {};;
			    _compile = format["awaken_tet = ['%1'] %2;",_item,_action];

                call (compile _compile);
                waitUntil { scriptDone awaken_tet };

                //diag_log format ["Wat is dis: %1", (compile _action)];
                if (awaken_useitem_result) then
                {
                    if (_consume) then
                    {
                        _unit removeItem _item;
                    };

                    if (_give != "") then
                    {
                        _unit addItem _give;
                    };
                };
            };
/*
            // FUELCAN
            if (_item == "rb_fuelcan" OR _item == "rb_fuelcan_empty" ) then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\fuelcan.sqf";};

            //refill WATER
            if (_item == "rb_canteen_empty" OR _item == "rb_bottle") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\refillwater.sqf";};

            //WATER PURIFICATION
            if (_item == "rb_waterpure" AND ("rb_bottledirty" in magazines _unit OR "rb_canteen_dirty" in magazines _unit) ) then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\purification.sqf";};

            //COOK MEAT
            if ( _item == "rb_meat"  AND  inflamed cursortarget  AND _unit distance cursortarget < 3) then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\cookmeat.sqf";};			

            // CHOP TREE
            if (_item == "rb_axe") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\axe.sqf";};

            // CRAFT first aid kit
            if (_item == "rb_bandage" OR _item == "rb_bloodbag") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\craftfirstaid.sqf";};

            // repairwheel
            //if (_item == "rb_TIRE" or _item == "rb_WRENCH") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\repair_tire.sqf";};

            //ANTIBIOTIC (f. sickness)
            if (_item == "rb_antibiotic") then {null = [_unit,_item] execVM "rickb_a3items\scripts\actions\takeAntibiotic.sqf";};

*/
            false
        }
    };      


    while {true} do
    {  
        waituntil {!(isnull (finddisplay 602))};     

        ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call fnc_dbl"];  
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", " _this call fnc_dbl"];  
        ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call fnc_dbl"];    

        waituntil {isnull (finddisplay 602)};      
    };  

};  