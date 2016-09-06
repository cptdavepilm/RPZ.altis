// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place primary rifles
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              weaponlist  : list of weapon class names
lootWeapon_list =
[
	[ // CIVIL
		0,
		[
			["LMG_mas_ww2_bar_F", 5.0],
			["arifle_mas_ww2_mp40_o", 10.0],
			["arifle_mas_ww2_mp44", 10.0],
			["arifle_mas_ww2_ppsh", 10.0],
			["arifle_mas_ww2_tommy", 10.0],
			["arifle_mas_ww2_m1g", 10.0],
			["arifle_mas_ww2_lee", 50.0],
			["arifle_mas_ww2_kar98", 50.0],
			["arifle_mas_ww2_ari", 40.0],
			["CUP_srifle_CZ550", 5.0],
			["CUP_sgun_Saiga12K", 30.0],
			["CUP_arifle_Sa58P", 5.0],
			["CUP_arifle_Sa58V", 5.0],
			["CUP_sgun_M1014", 50.0],
			["hlc_smg_mp5a4", 10.0],
			["hlc_smg_mp5n", 10.0],
			["hlc_smg_mp5sd5", 10.0],	
			["hlc_rifle_M1903A1_unertl", 5.0],
			["hlc_rifle_M1903A1", 40.0]
		]
	],
	[ // MILITARY HIGH
		1,
		[	
			["hlc_rifle_FAL5061", 1.0], //highend start
			["hlc_rifle_g3a3", 1.0],
			["hlc_rifle_m4", 5.0],
			["CUP_arifle_CZ805_A2", 5.0],
			["CUP_arifle_CZ805_A1", 5.0],
			["CUP_srifle_SVD_pso", 2.0],
			["CUP_srifle_VSSVintorez_pso", 1.0],
			["CUP_lmg_PKM", 1.0],
			["CUP_launch_RPG7V", 0.1],	//highend finish		
			["CUP_arifle_AK47", 100.0],
			["CUP_arifle_AK74", 100.0],
			["CUP_arifle_AK74M", 100.0],
			["CUP_arifle_AK74M_GL", 50.0],
			["CUP_arifle_AK74M_pso", 50.0],	
			["CUP_arifle_AK74M_kobra", 50.0],					
			["CUP_arifle_AK107", 100.0],
			["CUP_arifle_AK107_GL", 50.0],
			["CUP_arifle_AKS74", 100.0],
			["CUP_arifle_AKS74U", 100.0],
			["CUP_arifle_AK74_GL", 50.0],
			["CUP_arifle_AKM", 100.0],
			["CUP_arifle_AKS", 100.0],
			["CUP_arifle_RPK74_45", 50.0],
			["CUP_arifle_RPK74M", 50.0],
			["CUP_smg_bizon", 100.0],
			["hlc_smg_mp5a4", 100.0],
			["hlc_smg_mp5n", 100.0],
			["hlc_smg_mp5sd5", 100.0],
			["CUP_sgun_Saiga12K", 100.0],
			["CUP_sgun_M1014", 100.0],
			["CUP_arifle_Sa58RIS1", 50.0],
			["CUP_arifle_Sa58RIS2", 50.0],
			["CUP_arifle_AKS74UN_kobra_snds", 50.0],
			["R3F_M4S90", 100.0]
		]
	],
	[ // MILITARY LOW
		2,
		[	
			["CUP_arifle_AK47", 100.0],
			["CUP_arifle_AK74", 100.0],
			["CUP_arifle_AK74M", 100.0],
			["CUP_arifle_AK74M_GL", 50.0],
			["CUP_arifle_AK74M_pso", 50.0],	
			["CUP_arifle_AK74M_kobra", 50.0],					
			["CUP_arifle_AK107", 100.0],
			["CUP_arifle_AK107_GL", 50.0],
			["CUP_arifle_AKS74", 100.0],
			["CUP_arifle_AKS74U", 100.0],
			["CUP_arifle_AK74_GL", 50.0],
			["CUP_arifle_AKM", 100.0],
			["CUP_arifle_AKS", 100.0],
			["CUP_arifle_RPK74_45", 50.0],
			["CUP_arifle_RPK74M", 50.0],
			["CUP_smg_bizon", 100.0],
			["hlc_smg_mp5a4", 100.0],
			["hlc_smg_mp5n", 100.0],
			["hlc_smg_mp5sd5", 100.0],
			["CUP_sgun_Saiga12K", 100.0],
			["CUP_sgun_M1014", 100.0],
			["CUP_arifle_Sa58RIS1", 50.0],
			["CUP_arifle_Sa58RIS2", 50.0],
			["CUP_arifle_AKS74UN_kobra_snds", 50.0],
			["R3F_M4S90", 100.0]
		]
	],
	[ // INDUSTRIAL
		3,
		[
			["CUP_sgun_Saiga12K", 100.0],
			["CUP_sgun_M1014", 100.0],
			["arifle_mas_ww2_lee", 100.0],
			["arifle_mas_ww2_kar98", 100.0]
		]
	],
	[ // RESEARCH
		4,
		[
			["CUP_sgun_M1014", 100.0]
		]
	]
];

//here place small Weapons (anything smaler than smg) and usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              weaponlist  : list of weapon class names
lootWeaponPistol_list =
[
	[ // CIVIL
		0,
		[
			["Binocular", 100.0],
			["CUP_hgun_MicroUzi", 10.0],
			["CUP_hgun_Duty", 50.0],
			["CUP_hgun_M9", 50.0],
			["CUP_hgun_Makarov", 100.0],
			["CUP_hgun_TaurusTracker455", 100.0],
			["CUP_hgun_Colt1911", 100.0],
			["CUP_hgun_SA61", 20.0]
		]
	],
	[ // MILITARY Low
		1,
		[
			["Binocular", 100.0],
			["CUP_hgun_Duty", 100.0],
			["CUP_hgun_Phantom", 50.0],
			["CUP_hgun_Glock17", 100.0],
			["CUP_hgun_M9", 100.0],
			["CUP_hgun_Makarov", 100.0],
			["CUP_hgun_SA61", 50.0]
		]
	],
	[ // MILITARY High
		2,
		[
			["Binocular", 100.0],
			["CUP_hgun_Duty", 100.0],
			["CUP_hgun_Duty_M3X", 50.0],
			["CUP_hgun_Phantom", 50.0],
			["CUP_hgun_Phantom_Flashlight", 25.0],
			["CUP_hgun_Glock17", 100.0],
			["CUP_hgun_glock17_flashlight", 50.0],
			["CUP_hgun_M9", 100.0],
			["CUP_hgun_Makarov", 100.0],
			["hgun_Pistol_heavy_01_MRD_F", 10.0]
		]
	],
	[ // INDUSTRIAL
		3,
		[
			["Binocular", 100.0],
			["CUP_hgun_Makarov", 100.0],
			["CUP_hgun_Colt1911", 100.0],
			["CUP_hgun_TaurusTracker455", 100.0]
		]
	],
	[ // RESEARCH
		4,
		[
			["Binocular", 100.0],
			["CUP_hgun_M9", 10.0]
		]
	]
];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              magazinelist: list of magazine class names
lootMagazine_list =
[
	[ // CIVIL
		0,
		[
			["CUP_30Rnd_Sa58_M", 50.0],
			["Chemlight_blue",100.0],
			["Chemlight_green",100.0],
			["Chemlight_red",100.0],
			["Chemlight_yellow",100.0],
			["CUP_8Rnd_9x18_Makarov_M", 100.0],
			["CUP_6Rnd_45ACP_M", 100.0],
			["CUP_7Rnd_45ACP_1911", 100.0],
			["hlc_30Rnd_9x19_B_MP5", 60.0],
			["R3F_7Rnd_M4S90", 70.0],
			["CUP_8Rnd_B_Saiga12_74Slug_M", 100.0],
			["CUP_8Rnd_B_Saiga12_74Pellets_M", 100.0],
			["CUP_8Rnd_B_Beneli_74Slug", 100.0],
			["CUP_8Rnd_B_Beneli_74Pellets", 100.0],
			["hlc_5rnd_3006_1903", 60.0]
		]
	],
	[ // MILITARY Low
		1,
		[
			["1Rnd_Smoke_Grenade_shell", 50.0],
			["SmokeShell", 50.0],
			["SmokeShellPurple", 50.0],
			["SmokeShellBlue", 50.0],
			["SmokeShellGreen", 50.0],
			["SmokeShellYellow", 50.0],
			["SmokeShellOrange", 50.0],
			["SmokeShellRed", 50.0],
			["Chemlight_blue", 100.0],
			["Chemlight_green", 100.0],
			["Chemlight_red", 100.0],
			["Chemlight_yellow", 100.0],
			["hlc_30Rnd_9x19_B_MP5", 100.0],
			["R3F_7Rnd_M4S90", 100.0],
			["16Rnd_9x21_Mag", 50.0],
			["CUP_18Rnd_9x19_Phantom", 50.0],
			["CUP_17Rnd_9x19_glock17", 50.0],
			["CUP_15Rnd_9x19_M9", 50.0],
			["CUP_8Rnd_9x18_Makarov_M", 100.0],
			["CUP_30Rnd_9x19_UZI", 50.0],
			["CUP_6Rnd_45ACP_M", 100.0],
			["CUP_8Rnd_B_Saiga12_74Slug_M", 100.0],
			["CUP_8Rnd_B_Saiga12_74Pellets_M", 100.0],
			["CUP_30Rnd_762x39_AK47_M", 80.0],
			["CUP_30Rnd_545x39_AK_M", 80.0],
			["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",80.0],
			["CUP_IlumFlareWhite_GP25_M", 50.0],
			["CUP_1Rnd_HE_GP25_M", 20.0],
			["CUP_FlareWhite_GP25_M", 50.0],
			["CUP_1Rnd_SMOKE_GP25_M", 50.0],
			["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 40.0],
			["CUP_64Rnd_9x19_Bizon_M", 100.0],
			["CUP_7Rnd_45ACP_1911", 100.0],
			["CUP_20Rnd_B_765x17_Ball_M", 50.0],
			["CUP_5x_22_LR_17_HMR_M", 30.0],
			["CUP_20Rnd_B_765x17_Ball_M", 50.0],
			["CUP_8Rnd_B_Beneli_74Slug", 100.0],
			["CUP_8Rnd_B_Beneli_74Pellets", 100.0]
		]
	],
	[ // MILITARY High
		2,
		[

			["1Rnd_HE_Grenade_shell", 10.0],
			["1Rnd_Smoke_Grenade_shell", 50.0],
			["SmokeShell", 50.0],
			["SmokeShellPurple", 50.0],
			["SmokeShellBlue", 50.0],
			["SmokeShellGreen", 50.0],
			["SmokeShellYellow", 50.0],
			["SmokeShellOrange", 50.0],
			["SmokeShellRed", 50.0],
			["Chemlight_blue", 100.0],
			["Chemlight_green", 100.0],
			["Chemlight_red", 100.0],
			["Chemlight_yellow", 100.0],
			["HandGrenade", 10.0],
			["MiniGrenade", 10.0],
			["hlc_20Rnd_762x51_B_fal", 10.0],
			["hlc_20Rnd_762x51_B_G3", 10.0],
			["11Rnd_45ACP_Mag", 50.0],
			["30Rnd_556x45_Stanag", 20.0],
			["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 10.0],
			["CUP_10Rnd_762x54_SVD_M", 30.0],
			["CUP_20Rnd_9x39_SP5_VSS_M", 20.0],
			["CUP_10Rnd_9x39_SP5_VSS_M", 20.0],
			["hlc_30Rnd_9x19_B_MP5", 100.0],
			["R3F_7Rnd_M4S90", 100.0],
			["16Rnd_9x21_Mag", 50.0],
			["CUP_18Rnd_9x19_Phantom", 50.0],
			["CUP_17Rnd_9x19_glock17", 50.0],
			["CUP_15Rnd_9x19_M9", 50.0],
			["CUP_8Rnd_9x18_Makarov_M", 100.0],
			["CUP_30Rnd_9x19_UZI", 20.0],
			["CUP_6Rnd_45ACP_M", 100.0],
			["CUP_8Rnd_B_Saiga12_74Slug_M", 100.0],
			["CUP_8Rnd_B_Saiga12_74Pellets_M", 100.0],
			["CUP_30Rnd_762x39_AK47_M", 100.0],
			["CUP_30Rnd_545x39_AK_M", 100.0],
			["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 50.0],
			["CUP_IlumFlareWhite_GP25_M", 50.0],
			["CUP_1Rnd_HE_GP25_M", 10.0],
			["CUP_FlareWhite_GP25_M", 50.0],
			["CUP_1Rnd_SMOKE_GP25_M", 50.0],
			["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 10.0],
			["CUP_64Rnd_9x19_Bizon_M", 100.0],
			["CUP_7Rnd_45ACP_1911", 100.0],
			["CUP_20Rnd_B_765x17_Ball_M", 20.0],
			["CUP_8Rnd_B_Beneli_74Slug", 100.0],
			["CUP_8Rnd_B_Beneli_74Pellets", 100.0]
		]
	],
	[ // INDUSTRIAL
		3,
		[
			["Chemlight_blue",100.0],
			["Chemlight_green",100.0],
			["Chemlight_red",100.0],
			["Chemlight_yellow",100.0],
			["CUP_8Rnd_9x18_Makarov_M", 100.0],
			["CUP_6Rnd_45ACP_M", 100.0],
			["CUP_7Rnd_45ACP_1911", 100.0],
			["CUP_8Rnd_B_Beneli_74Slug", 100.0],
			["CUP_8Rnd_B_Beneli_74Pellets", 100.0]
		]
	],
	[ // RESEARCH
		4,
		[
			["Chemlight_blue",100.0],
			["Chemlight_green",100.0],
			["Chemlight_red",100.0],
			["Chemlight_yellow",100.0]
		]
	]
];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              itemlist    : list of item class names
lootItem_list =
[
	[ // CIVIL
		0,
		[
			["V_Rangemaster_belt", 100.0],
			["V_BandollierB_khk", 100.0],
			["V_BandollierB_cbr", 100.0],
			["V_BandollierB_rgr", 100.0],
			["V_BandollierB_blk", 100.0],
			["V_BandollierB_oli", 100.0],
			["H_Shemag_khk", 100.0],
			["H_Shemag_tan", 100.0],
			["H_Shemag_olive", 100.0],
			["H_Shemag_olive_hs", 100.0],
			["H_ShemagOpen_khk", 100.0],
			["H_ShemagOpen_tan", 100.0],
			["H_Beret_blk", 100.0],
			["H_Beret_blk_POLICE", 100.0],
			["H_Beret_red", 100.0],
			["H_Beret_grn", 100.0],
			["H_Beret_02", 100.0],
			["H_MilCap_ocamo", 100.0],
			["H_MilCap_mcamo", 100.0],
			["H_MilCap_oucamo", 100.0],
			["H_MilCap_rucamo", 100.0],
			["H_MilCap_gry", 100.0],
			["H_MilCap_dgtl", 100.0],
			["H_MilCap_blue", 100.0],
			["FirstAidKit", 60.0],
			["CUP_5x_22_LR_17_HMR_M", 30.0]
		]
	],
	[ // MILITARY Low
		1,
		[
			["V_Rangemaster_belt", 100.0],
			["V_BandollierB_khk", 100.0],
			["V_BandollierB_cbr", 100.0],
			["V_BandollierB_rgr", 100.0],
			["V_BandollierB_blk", 100.0],
			["V_BandollierB_oli", 100.0],
			["V_Chestrig_khk", 100.0],
			["V_Chestrig_rgr", 100.0],
			["V_Chestrig_blk", 100.0],
			["V_Chestrig_oli", 100.0],
			["V_TacVest_khk", 1.0],
			["V_TacVest_brn", 1.0],
			["V_TacVest_oli", 1.0],
			["V_TacVest_blk", 1.0],
			["V_TacVest_camo", 1.0],
			["V_TacVestIR_blk", 1.0],
			["V_TacVestCamo_khk", 1.0],
			["H_Shemag_khk", 100.0],
			["H_Shemag_tan", 100.0],
			["H_Shemag_olive", 100.0],
			["H_Shemag_olive_hs", 100.0],
			["H_ShemagOpen_khk", 100.0],
			["H_ShemagOpen_tan", 100.0],
			["H_Beret_blk", 100.0],
			["H_Beret_blk_POLICE", 100.0],
			["H_Beret_red", 100.0],
			["H_Beret_grn", 100.0],
			["H_Beret_02", 100.0],
			["H_MilCap_ocamo", 100.0],
			["H_MilCap_mcamo", 100.0],
			["H_MilCap_oucamo", 100.0],
			["H_MilCap_rucamo", 100.0],
			["H_MilCap_gry", 100.0],
			["H_MilCap_dgtl", 100.0],
			["H_MilCap_blue", 100.0],
			["CUP_optic_PSO_1", 10.0],
			["CUP_optic_PSO_3", 1.0],
			["CUP_optic_Kobra", 30.0],
			["CUP_muzzle_PBS4", 10.0],
			["CUP_muzzle_Bizon", 40.0],
			["CUP_acc_Glock17_Flashlight", 30.0],
			["CUP_muzzle_snds_M9", 30.0],
			["CUP_muzzle_snds_MicroUzi", 30.0],
			["CUP_SVD_camo_g", 20.0],
			["CUP_acc_CZ_M3X", 40.0],
			["optic_Aco", 20.0],
			["optic_Holosight", 20.0],
			["acc_flashlight", 40.0],
			["acc_pointer_IR", 20.0],
			["FHQ_optic_ACOG", 5.0],
			["FHQ_optic_AIM", 20.0],
			["FHQ_optic_MicroCCO", 20.0],
			["FirstAidKit", 40.0]
		]
	],
	[ // MILITARY High
		2,
		[
			["V_Rangemaster_belt", 100.0],
			["V_BandollierB_khk", 100.0],
			["V_BandollierB_cbr", 100.0],
			["V_BandollierB_rgr", 100.0],
			["V_BandollierB_blk", 100.0],
			["V_BandollierB_oli", 100.0],
			["V_Chestrig_khk", 100.0],
			["V_Chestrig_rgr", 100.0],
			["V_Chestrig_blk", 100.0],
			["V_Chestrig_oli", 100.0],
			["V_TacVest_khk", 10.0],
			["V_TacVest_brn", 10.0],
			["V_TacVest_oli", 10.0],
			["V_TacVest_blk", 10.0],
			["V_TacVest_camo", 10.0],
			["V_TacVestIR_blk", 10.0],
			["V_TacVestCamo_khk", 10.0],
			["H_Shemag_khk", 100.0],
			["H_Shemag_tan", 100.0],
			["H_Shemag_olive", 100.0],
			["H_Shemag_olive_hs", 100.0],
			["H_ShemagOpen_khk", 100.0],
			["H_ShemagOpen_tan", 100.0],
			["H_Beret_blk", 100.0],
			["H_Beret_blk_POLICE", 100.0],
			["H_Beret_red", 100.0],
			["H_Beret_grn", 100.0],
			["H_Beret_02", 100.0],
			["H_MilCap_ocamo", 100.0],
			["H_MilCap_mcamo", 100.0],
			["H_MilCap_oucamo", 100.0],
			["H_MilCap_rucamo", 100.0],
			["H_MilCap_gry", 100.0],
			["H_MilCap_dgtl", 100.0],
			["H_MilCap_blue", 100.0],
			["CUP_optic_PSO_1", 10.0],
			["CUP_optic_PSO_3", 1.0],
			["CUP_optic_Kobra", 30.0],
			["CUP_muzzle_PBS4", 10.0],
			["CUP_muzzle_Bizon", 40.0],
			["CUP_acc_Glock17_Flashlight", 30.0],
			["CUP_muzzle_snds_M9", 30.0],
			["CUP_muzzle_snds_MicroUzi", 30.0],
			["CUP_SVD_camo_g", 20.0],
			["CUP_acc_CZ_M3X", 40.0],
			["optic_Aco", 20.0],
			["optic_Holosight", 20.0],
			["acc_flashlight", 40.0],
			["acc_pointer_IR", 20.0],
			["FHQ_optic_ACOG", 5.0],
			["FHQ_optic_AIM", 20.0],
			["FHQ_optic_MicroCCO", 20.0],
			["FirstAidKit", 40.0]
		]
	],
	[ // INDUSTRIAL
		3,
		[
			["V_Rangemaster_belt", 100.0],
			["V_BandollierB_khk", 100.0],
			["V_BandollierB_cbr", 100.0],
			["V_BandollierB_rgr", 100.0],
			["V_BandollierB_blk", 100.0],
			["V_BandollierB_oli", 100.0],
			["ToolKit", 20.0]
		]
	],
	[ // RESEARCH
		4,
		[
			["V_Rangemaster_belt", 100.0],
			["FirstAidKit", 100.0]
		]
	]
];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              backpacklist: list of backpack class names
lootBackpack_list =
[
	[ // CIVIL
		0,
		[
			["B_FieldPack_oucamo", 100.0],
			["B_FieldPack_khk", 100.0],
			["B_FieldPack_cbr", 100.0],
			["B_FieldPack_blk", 100.0],
			["B_Kitbag_cbr", 50.0],
			["B_Kitbag_rgr", 50.0],
			["B_Kitbag_mcamo", 50.0],
			["B_Kitbag_sgg", 50.0]
		]
	],
	[ // MILITARY Low
		1,
		[
			["B_FieldPack_blk", 100.0],
			["B_FieldPack_cbr", 100.0],
			["B_FieldPack_khk", 100.0],
			["B_FieldPack_oucamo", 100.0],
			["B_Kitbag_cbr", 80.0],
			["B_Kitbag_rgr", 80.0],
			["B_Kitbag_mcamo", 80.0],
			["B_Kitbag_sgg", 80.0],
			["B_Bergen_blk", 50.0],
			["B_Bergen_rgr", 50.0],
			["B_Bergen_mcamo", 50.0],
			["B_Bergen_sgg", 50.0],
			["B_Carryall_khk", 1.0],
			["B_Carryall_mcamo", 1.0],
			["B_Carryall_oli", 1.0],
			["B_Carryall_oucamo", 1.0]
		]
	],
		[ // MILITARY High
		2,
		[
			["B_FieldPack_blk", 100.0],
			["B_FieldPack_cbr", 100.0],
			["B_FieldPack_khk", 100.0],
			["B_FieldPack_oucamo", 100.0],
			["B_Kitbag_cbr", 80.0],
			["B_Kitbag_rgr", 80.0],
			["B_Kitbag_mcamo", 80.0],
			["B_Kitbag_sgg", 80.0],
			["B_Bergen_blk", 50.0],
			["B_Bergen_rgr", 50.0],
			["B_Bergen_mcamo", 50.0],
			["B_Bergen_sgg", 50.0],
			["B_Carryall_khk", 10.0],
			["B_Carryall_mcamo", 10.0],
			["B_Carryall_oli", 10.0],
			["B_Carryall_oucamo", 10.0]
		]
	],
	[ // INDUSTRIAL
		3,
		[
			["B_FieldPack_blk", 100.0],
			["B_FieldPack_cbr", 100.0],
			["B_FieldPack_khk", 100.0],
			["B_FieldPack_oucamo", 100.0],
			["B_Kitbag_cbr", 50.0],
			["B_Kitbag_rgr", 50.0],
			["B_Kitbag_mcamo", 50.0],
			["B_Kitbag_sgg", 50.0]
			
		]
	],
	[ // RESEARCH
		4,
		[
			["B_FieldPack_blk", 100.0],
			["B_FieldPack_cbr", 100.0],
			["B_FieldPack_khk", 100.0],
			["B_FieldPack_oucamo", 100.0]
		]
	]
];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              objectlist  : list of worldobject class names
lootworldObject_list =
[
	[ // CIVIL
		0,
		[
			["Land_BakedBeans_F", 100.0], 			// food               
			["Land_BottlePlastic_V2_F", 100.0],		// water         
			["Land_Can_V3_F", 100.0]				// energydrink                  
		]            
	],
	[ // MILITARY
		1,
		[
			["Land_BakedBeans_F", 100.0], 			// food               
			["Land_BottlePlastic_V2_F", 100.0],		// water         
			["Land_Can_V3_F", 100.0]				// energydrink    
		]
	],
	[ // INDUSTRIAL
		2,
		[
			["Land_BakedBeans_F", 100.0], 			// food               
			["Land_BottlePlastic_V2_F", 100.0],		// water         
			["Land_Can_V3_F", 100.0],				// energydrink    
			["Land_Suitcase_F", 20.0], 				// repairkit                
			["Land_CanisterOil_F", 20.0], 			// syphon hose             
			["Land_CanisterFuel_F", 50.0]			// jerrycan
		]
	],
	[ // RESEARCH
		3,
		[
			["Land_BakedBeans_F", 100.0], 			// food               
			["Land_BottlePlastic_V2_F", 100.0],		// water         
			["Land_Can_V3_F", 100.0]				// energydrink    
		]
	]
];
