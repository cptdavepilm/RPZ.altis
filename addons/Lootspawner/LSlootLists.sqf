// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//["lootWeapon_list[" array of [class, [weaponlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              weaponlist  : list of weapon class names
lootWeapon_list =
[
	[ // CIVIL
		0,
		[
			["arifle_MK20C_F", 0.2],
			["arifle_MK20_F", 0.2],
			["arifle_TRG20_F", 0.2],
			["arifle_TRG21_F", 0.2],
			["Binocular", 0.2],
			["hgun_PDW2000_F", 0.2]
		]
	],
	[ // MILITARY
		1,
		[
			["arifle_Katiba_C_F", 0.2],
			["arifle_Katiba_F", 0.2],
			["arifle_Katiba_GL_F", 0.2],
			["arifle_Mk20C_F", 0.2],
			["arifle_Mk20_F", 0.2],
			["arifle_Mk20_GL_F", 0.2],
			["arifle_MXC_F", 0.2],
			["arifle_MXM_F", 0.2],
			["arifle_MX_F", 0.2],
			["arifle_MX_GL_F", 0.2],
			["arifle_MX_SW_F", 0.2],
			["arifle_SDAR_F", 0.2],
			["arifle_TRG20_F", 0.2],
			["arifle_TRG21_F", 0.2],
			["arifle_TRG21_GL_F", 0.2],
			["Binocular", 0.2],
			["hgun_PDW2000_F", 0.2],
			["LMG_Mk200_F", 0.2],
			["LMG_Zafir_F", 0.2],
			["Rangefinder", 0.2],
			["srifle_EBR_F", 0.2],
			["srifle_GM6_F", 0.2],
			["srifle_LRR_F", 0.2]
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["arifle_Mk20C_F", 0.2],
			["arifle_Mk20_F", 0.2],
			["arifle_TRG20_F", 0.2],
			["arifle_TRG21_F", 0.2],
			["arifle_Katiba_C_F", 0.2],
			["arifle_MXC_F", 0.2],
			["Binocular", 0.2]
		]
	],
	[ // RESEARCH
		3,
		[
			["arifle_Katiba_GL_F", 0.2],
			["arifle_MXC_F", 0.2],
			["arifle_MXM_F", 0.2],
			["arifle_MX_GL_F", 0.2],
			["Rangefinder", 0.2],
			["srifle_GM6_F", 0.2],
			["srifle_LRR_F", 0.2]
		]
	]
];

lootWeaponPistol_list =
[
	[ // CIVIL
		0,
		[
			["SMG_01_F", 0.2],                         // Vermin .45 ACP
			["SMG_02_F", 0.2]                         // Sting 9mm
		]
	],
	[ // MILITARY
		1,
		[
			["SMG_01_F", 0.2],                         // Vermin .45 ACP
			["SMG_02_F", 0.2]                         // Sting 9mm
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["Binocular", 0.2],
			["SMG_01_F", 0.2],                         // Vermin .45 ACP
			["SMG_02_F", 0.2]                       // Sting 9mm
		]
	],
	[ // RESEARCH
		3,
		[
			["Rangefinder", 0.2]
		]
	]
];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//["lootMagazine_list[" array of [class, [magazinelist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              magazinelist: list of magazine class names
lootMagazine_list =
[
	[ // CIVIL
		0,
		[
			//["16Rnd_9x21_Mag", 0.2],
			["9Rnd_45ACP_Mag", 0.2],
			["30Rnd_9x21_Mag", 0.2],
			["30Rnd_45ACP_Mag_SMG_01_tracer_green", 0.2],
			["30Rnd_556x45_Stanag_Tracer_Yellow", 0.2],
			["30Rnd_65x39_caseless_mag_Tracer", 0.2],
			["30Rnd_65x39_caseless_green_mag_Tracer", 0.2]
		]
	],
	[ // MILITARY
		1,
		[
			["100Rnd_65x39_caseless_mag", 0.2],
			["100Rnd_65x39_caseless_mag_Tracer", 0.2],
			["150Rnd_762x51_Box", 0.2],
			["150Rnd_762x51_Box_Tracer", 0.2],
			["1Rnd_HE_Grenade_shell", 0.2],
			["1Rnd_Smoke_Grenade_shell", 0.2],
			["SmokeShell", 0.2],
			["SmokeShellPurple", 0.2],
			["SmokeShellBlue", 0.2],
			["SmokeShellGreen", 0.2],
			["SmokeShellYellow", 0.2],
			["SmokeShellOrange", 0.2],
			["SmokeShellRed", 0.2],
			["200Rnd_65x39_cased_Box", 0.2],
			["200Rnd_65x39_cased_Box_Tracer", 0.2],
			["20Rnd_556x45_UW_mag", 0.2],
			["20Rnd_762x51_Mag", 0.2],
			["20Rnd_762x51_Mag", 0.2],
			["30Rnd_45ACP_Mag_SMG_01", 0.2],
			["30Rnd_45ACP_Mag_SMG_01", 0.2],
			["30Rnd_556x45_Stanag", 0.2],
			["30Rnd_556x45_Stanag_Tracer_Yellow", 0.2],
			["30Rnd_65x39_caseless_green", 0.2],
			["30Rnd_65x39_caseless_green_mag_Tracer", 0.2],
			["30Rnd_65x39_caseless_mag", 0.2],
			["30Rnd_65x39_caseless_mag_Tracer", 0.2],
			["30Rnd_9x21_Mag", 0.2],
			["30Rnd_9x21_Mag", 0.2],
			["5Rnd_127x108_Mag", 0.2],
			["7Rnd_408_Mag", 0.2],
			["9Rnd_45ACP_Mag", 0.2],
			["9Rnd_45ACP_Mag", 0.2],
			["APERSBoundingMine_Range_Mag", 0.2],
			["APERSMine_Range_Mag", 0.2],
			["APERSTripMine_Wire_Mag", 0.2],
			["ATMine_Range_Mag", 0.2],
			["ClaymoreDirectionalMine_Remote_Mag", 0.2],
			["HandGrenade", 0.2],
			["MiniGrenade", 0.2],
			["SatchelCharge_Remote_Mag", 0.2],
			["SLAMDirectionalMine_Wire_Mag", 0.2]
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["30Rnd_9x21_Mag", 0.2],
			["30Rnd_45ACP_Mag_SMG_01", 0.2],
			["30Rnd_556x45_Stanag", 0.2],
			["30Rnd_556x45_Stanag_Tracer_Yellow", 0.2],
			["30Rnd_65x39_caseless_green", 0.2],
			["30Rnd_65x39_caseless_green_mag_Tracer", 0.2],
			["30Rnd_65x39_caseless_mag", 0.2],
			["30Rnd_65x39_caseless_mag_Tracer", 0.2]
		]
	],
	[ // RESEARCH
		3,
		[
			["20Rnd_556x45_UW_mag", 0.2],
			["30Rnd_556x45_Stanag", 0.2],
			["30Rnd_556x45_Stanag", 0.2],
			["30Rnd_65x39_caseless_mag", 0.2],
			["30Rnd_65x39_caseless_mag", 0.2],
			["30Rnd_65x39_caseless_green", 0.2],
			["30Rnd_65x39_caseless_green", 0.2],
			["5Rnd_127x108_Mag", 0.2],
			["7Rnd_408_Mag", 0.2]
		]
	]
];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//["lootItem_list[" array of [class, [itemlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              itemlist    : list of item class names
lootItem_list =
[
	[ // CIVIL
		0,
		[
			["acc_flashlight", 0.2],
			["FirstAidKit", 0.2],
			["FirstAidKit", 0.2],
			["FirstAidKit", 0.2],
			["muzzle_snds_acp", 0.2],                  // .45 ACP
			["muzzle_snds_L", 0.2],                    // 9mm
			["optic_Aco", 0.2],
			["optic_ACO_grn", 0.2],
			["optic_aco_smg", 0.2],
			["optic_Holosight", 0.2],
			["optic_Holosight_smg", 0.2]
		]
	],
	[ // MILITARY
		1,
		[
			["acc_flashlight", 0.2],
			["acc_pointer_IR", 0.2],
			["FirstAidKit", 0.2],
			["ItemGPS", 0.2],
			["Medikit", 0.2],
			["muzzle_snds_acp", 0.2],                  // .45 ACP
			["muzzle_snds_B", 0.2],                    // 7.62mm
			["muzzle_snds_H", 0.2],                    // 6.5mm
			["muzzle_snds_H_MG", 0.2],                 // 6.5mm LMG
			["muzzle_snds_L", 0.2],                    // 9mm
			["muzzle_snds_M", 0.2],                    // 5.56mm
			["NVGoggles", 0.2],
			//["NVGoggles_INDEP", 0.2],
			//["NVGoggles_OPFOR", 0.2],
			["optic_Aco", 0.2],
			["optic_ACO_grn", 0.2],
			["optic_aco_smg", 0.2],
			["optic_Arco", 0.2],
			["optic_Hamr", 0.2],
			["optic_Holosight", 0.2],
			["optic_Holosight_smg", 0.2],
			["optic_SOS", 0.2],
			["ToolKit", 0.2],
			["H_HelmetB", 0.2],
			["H_HelmetIA", 0.2],
			["H_HelmetO_ocamo", 0.2],
			["V_PlateCarrier1_rgr", 0.2],
			["V_PlateCarrierIA1_dgtl", 0.2],
			["V_HarnessO_brn", 0.2]
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["FirstAidKit", 0.2],
			["FirstAidKit", 0.2],
			["Medikit", 0.2],
			["ToolKit", 0.2]
		]
	],
	[ // RESEARCH
		3,
		[
			["FirstAidKit", 0.2],
			["FirstAidKit", 0.2],
			["FirstAidKit", 0.2],
			["ItemGPS", 0.2],
			["Medikit", 0.2],
			["NVGoggles", 0.2],
			//["NVGoggles_INDEP", 0.2],
			//["NVGoggles_OPFOR", 0.2],
			["optic_Nightstalker", 0.2],
			["optic_NVS", 0.2],
			["optic_SOS", 0.2],
			["V_RebreatherB", 0.2]
		]
	]
];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//["lootBackpack_list[" array of [class, [backpacklist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              backpacklist: list of backpack class names
lootBackpack_list =
[
	[ // CIVIL
		0,
		[
			["B_FieldPack_blk", 0.2],
			["B_FieldPack_cbr", 0.2],
			["B_FieldPack_khk", 0.2],
			["B_FieldPack_oucamo", 0.2]
		]
	],
	[ // MILITARY
		1,
		[
			["B_FieldPack_blk", 0.2],
			["B_FieldPack_cbr", 0.2],
			["B_FieldPack_khk", 0.2],
			["B_FieldPack_oucamo", 0.2],
			["B_Kitbag_cbr", 0.2],
			["B_Kitbag_rgr", 0.2],
			["B_Kitbag_mcamo", 0.2],
			["B_Kitbag_sgg", 0.2],
			["B_Bergen_blk", 0.2],
			["B_Bergen_rgr", 0.2],
			["B_Bergen_mcamo", 0.2],
			["B_Bergen_sgg", 0.2],
			["B_Carryall_khk", 0.2],
			["B_Carryall_mcamo", 0.2],
			["B_Carryall_oli", 0.2],
			["B_Carryall_oucamo", 0.2]
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["B_FieldPack_blk", 0.2],
			["B_FieldPack_cbr", 0.2],
			["B_FieldPack_khk", 0.2],
			["B_FieldPack_oucamo", 0.2],
			["B_Kitbag_cbr", 0.2],
			["B_Kitbag_rgr", 0.2],
			["B_Kitbag_mcamo", 0.2],
			["B_Kitbag_sgg", 0.2]
		]
	],
	[ // RESEARCH
		3,
		[
			["B_FieldPack_blk", 0.2],
			["B_FieldPack_cbr", 0.2],
			["B_FieldPack_khk", 0.2],
			["B_FieldPack_oucamo", 0.2],
			["B_Kitbag_cbr", 0.2],
			["B_Kitbag_rgr", 0.2],
			["B_Kitbag_mcamo", 0.2],
			["B_Kitbag_sgg", 0.2],
			["B_Bergen_blk", 0.2],
			["B_Bergen_rgr", 0.2],
			["B_Bergen_mcamo", 0.2],
			["B_Bergen_sgg", 0.2],
			["B_Carryall_khk", 0.2],
			["B_Carryall_mcamo", 0.2],
			["B_Carryall_oli", 0.2],
			["B_Carryall_oucamo", 0.2]
		]
	]
];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//["lootworldObject_list[" array of [class, [objectlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              objectlist  : list of worldobject class names
lootworldObject_list =
[
	[ // CIVIL
		0,
		[
			["Land_BakedBeans_F", 0.2],                // food
			["Land_BakedBeans_F", 0.2],                // food
			["Land_BottlePlastic_V2_F", 0.2],          // water
			["Land_BottlePlastic_V2_F", 0.2],          // water
			["Land_Can_V3_F", 0.2],                    // energydrink
			["Land_Suitcase_F", 0.2],                  // repairkit
			["Land_CanisterOil_F", 0.2],               // syphon hose
			["Land_CanisterFuel_F", 0.2]               // jerrycan
		]
	],
	[ // MILITARY
		1,
		[
			["Land_BakedBeans_F", 0.2],                // food
			["Land_BottlePlastic_V2_F", 0.2],          // water
			["Land_Can_V3_F", 0.2],                    // energydrink
			["Land_Suitcase_F", 0.2],                  // repairkit
			["Land_CanisterOil_F", 0.2],               // syphon hose
			["Land_CanisterFuel_F", 0.2]               // jerrycan
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["Land_BakedBeans_F", 0.2],                // food
			["Land_BottlePlastic_V2_F", 0.2],          // water
			["Land_Can_V3_F", 0.2],                    // energydrink
			["Land_Suitcase_F", 0.2],                  // repairkit
			["Land_Suitcase_F", 0.2],                  // repairkit
			["Land_CanisterOil_F", 0.2],               // syphon hose
			["Land_CanisterOil_F", 0.2],               // syphon hose
			["Land_CanisterFuel_F", 0.2],              // jerrycan
			["Land_CanisterFuel_F", 0.2]               // jerrycan
		]
	],
	[ // RESEARCH
		3,
		[
			["Land_BakedBeans_F", 0.2],                // food
			["Land_BottlePlastic_V2_F", 0.2],          // water
			["Land_Can_V3_F", 0.2],                    // energydrink
			["Land_Suitcase_F", 0.2],                  // repairkit
			["Land_CanisterOil_F", 0.2],               // syphon hose
			["Land_CanisterFuel_F", 0.2]               // jerrycan
		]
	]
];
