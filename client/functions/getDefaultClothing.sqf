// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_uniforms", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_uniforms = [
	"U_C_Poor_1",
	"CUP_U_C_Worker_01",
	"CUP_U_I_GUE_Anorak_01",
	"CUP_U_C_Worker_04",
	"CUP_U_C_Worker_03",
	"U_C_Man_casual_3_F",
	"CUP_U_C_Worker_02",
	"U_C_Man_casual_1_F",
	"CUP_U_C_Woodlander_04",
	"CUP_U_O_CHDKZ_Lopotev",
	"CUP_U_C_Woodlander_01",
	"CUP_U_C_Citizen_02",
	"CUP_U_C_Citizen_04",
	"CUP_U_C_Woodlander_02",
	"CUP_U_C_Citizen_01",
	"CUP_U_C_Citizen_03",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"CUP_U_C_Villager_03",
	"CUP_U_C_Villager_02",
	"U_C_Poloshirt_redwhite",
	"CUP_U_C_Villager_04",
	"U_C_Poloshirt_salmon",
	"CUP_U_C_Villager_01",
	"U_C_Poloshirt_stripped",
	"TRYK_U_B_Denim_T_WH",
	"U_C_Poloshirt_tricolour",
	"TRYK_U_B_Denim_T_BK",
	"CUP_U_I_GUE_Anorak_03",
	"TRYK_U_B_Denim_T_BG_WH",
	"TRYK_U_B_Denim_T_BG_BK",
	"TRYK_U_B_BLK_T_WH",
	"TRYK_U_B_BLK_T_BG_BK",
	"TRYK_U_B_RED_T_BR",
	"TRYK_SUITS_BR_F",
	"TRYK_SUITS_BLK_F",
	"TRYK_U_denim_jersey_blu",
	"TRYK_U_denim_jersey_blk",
	"TRYK_U_denim_hood_nc",
	"TRYK_U_denim_hood_blk",
	"TRYK_shirts_DENIM_WH_Sleeve",
	"TRYK_shirts_DENIM_R_Sleeve",
	"TRYK_shirts_DENIM_WHB_Sleeve",
	"TRYK_shirts_DENIM_BL",
	"TRYK_shirts_DENIM_BWH_Sleeve",
	"TRYK_U_B_GRTAN_CombatUniform",
	"TRYK_T_OD_PAD",
	"TRYK_shirts_DENIM_RED2_Sleeve",
	"TRYK_shirts_DENIM_BK_Sleeve",
	"TRYK_shirts_DENIM_ylb_Sleeve",
	"TRYK_shirts_DENIM_od_Sleeve",
	"TRYK_shirts_DENIM_ylb",
	"TRYK_U_B_PCUGs_BLK_R",
	"TRYK_U_B_wh_blk_Rollup_CombatUniform",
	"TRYK_U_B_PCUGs_gry",
	"TRYK_U_B_PCUGs_BLK",
	"TRYK_U_B_GRTANR_CombatUniformTshirt",
	"TRYK_OVERALL_SAGE_BLKboots_nk_blk2",
	"TRYK_OVERALL_nok_flesh",
	"TRYK_OVERALL_SAGE_BLKboots_nk_blk",
	"TRYK_U_B_ODTAN_CombatUniform",
	"TRYK_U_B_PCUGs_gry_R",
	"TRYK_U_B_wh_tan_Rollup_CombatUniform",
	"TRYK_OVERALL_SAGE_BLKboots_nk",
	"TRYK_U_B_OD_OD_R_CombatUniform",
	"TRYK_U_B_ODTANR_CombatUniformTshirt",
	"TRYK_U_B_OD_OD_CombatUniform",
	"U_BG_Guerilla2_3",
	"CUP_U_C_Labcoat_03",
	"CUP_U_C_Labcoat_01",
	"U_Marshal",
	"CUP_U_C_Policeman_01",
	"CUP_U_C_Priest_01",
	"CUP_U_C_Profiteer_02",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_U_C_Profiteer_03",
	"U_C_Journalist",
	"TRYK_U_B_BLK_tan_Rollup_CombatUniform",
	"CUP_U_C_Labcoat_02",
	"CUP_U_C_Rocker_01",
	"TRYK_U_B_wh_OD_Rollup_CombatUniform",
	"CUP_U_C_Rocker_02",
	"TRYK_U_B_PCUGs_OD_R",
	"CUP_U_C_Profiteer_04",
	"TRYK_U_B_BLK_OD_Rollup_CombatUniform",
	"CUP_U_C_Pilot_01",
	"U_C_HunterBody_grn",
	"CUP_O_TKI_Khet_Jeans_02",
	"TRYK_U_B_BLK_TAN_1",
	"CUP_O_TKI_Khet_Jeans_04",
	"TRYK_U_B_C02_Tsirt",
	"TRYK_U_B_BLKTAN_CombatUniform",
	"TRYK_U_B_BLTAN_T",
	"TRYK_U_B_BLOD_T",
	"TRYK_U_B_BLK_OD",
	"CUP_U_C_Suit_01",
	"TRYK_U_B_PCUHsW3nh",
	"TRYK_U_B_PCUHsW3",
	"U_BG_Guerilla2_2",
	"CUP_U_C_Profiteer_01",
	"U_BG_Guerilla2_1"
];

_head = [
	"CUP_H_SLA_BeretRed",
	"CUP_H_BAF_Officer_Beret",
	"G_Aviator",
	"H_Bandanna_gry",
	"G_Balaclava_blk",
	"H_Bandanna_blu",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"H_Bandanna_cbr",
	"G_Balaclava_oli",
	"CUP_H_FR_BandanaGreen",
	"G_Bandanna_aviator",
	"H_Bandanna_khk",
	"H_Bandanna_sgg",
	"G_Bandanna_beast",
	"H_Bandanna_sand",
	"G_Bandanna_khk",
	"G_Bandanna_shades",
	"H_Bandanna_surfer",
	"G_Bandanna_sport",
	"G_Bandanna_tan",
	"H_Bandanna_surfer_blk",
	"G_Lowprofile",
	"CUP_TK_NeckScarf",
	"H_Bandanna_surfer_grn",
	"CUP_FR_NeckScarf",
	"CUP_H_FR_BandanaWdl",
	"CUP_FR_NeckScarf2",
	"H_Bandanna_camo",
	"G_Shades_Blue",
	"G_Shades_Green",
	"H_Watchcap_blk",
	"G_Shades_Red",
	"CUP_H_C_Beanie_01",
	"CUP_H_C_Beanie_02",
	"G_Sport_Red",
	"CUP_H_C_Beanie_03",
	"G_Sport_BlackWhite",
	"H_Watchcap_cbr",
	"G_Sport_Checkered",
	"G_Sport_Greenblack",
	"G_Squares",
	"CUP_H_C_Beanie_04",
	"G_Squares_Tinted",
	"H_Watchcap_camo",
	"H_Watchcap_khk",
	"G_Tactical_Black",
	"CUP_H_ChDKZ_Beanie",
	"G_Spectacles_Tinted",
	"H_Beret_blk",
	"CUP_H_C_Beret_04",
	"TRYK_kio_balaclava_WH",
	"CUP_H_C_Beret_01",
	"H_Beret_gen_F",
	"TRYK_bandana_g",
	"CUP_H_C_Beret_02",
	"TRYK_Beard_BK",
	"CUP_H_C_Beret_03",
	"CUP_H_RUS_Beret_Spetsnaz",
	"CUP_H_RUS_Beret_VDV",
	"TRYK_Beard_BK3",
	"H_Beret_02",
	"TRYK_Beard_BW3",
	"H_Beret_Colonel",
	"TRYK_Beard_BK4",
	"TRYK_Beard_Gr3",
	"TRYK_Beard4",
	"CUP_H_FR_BoonieMARPAT",
	"TRYK_headset2_glasses",
	"CUP_H_Ger_Boonie_desert",
	"TRYK_headset_Glasses",
	"TRYK_Shemagh_mesh",
	"CUP_H_FR_BoonieWDL",
	"TRYK_Shemagh_G",
	"TRYK_Shemagh",
	"TRYK_Shemagh_WH",
	"CUP_H_FR_PRR_BoonieWDL",
	"H_Booniehat_khk_hs",
	"H_Booniehat_oli",
	"H_Booniehat_dgtl",
	"TRYK_Shemagh_EAR_G",
	"TRYK_Shemagh_EAR_TAN",
	"H_Booniehat_tan",
	"TRYK_Shemagh_EAR_WH",
	"H_Cap_grn_BI",
	"H_Cap_blk",
	"TRYK_Shemagh_ESS_G",
	"TRYK_Shemagh_ESS_WH",
	"TRYK_Shemagh_shade_MH",
	"TRYK_Shemagh_shade_G",
	"H_Cap_blu",
	"TRYK_Shemagh_shade",
	"TRYK_Shemagh_shade_WH",
	"TRYK_TAC_EARMUFF_Gs",
	"CUP_H_PMC_Cap_Burberry",
	"TRYK_TAC_SET_bn",
	"TRYK_NOMIC_TAC_EARMUFF_Gs",
	"TRYK_TAC_EARMUFF_SHADE_Gs",
	"H_Cap_blk_CMMG",
	"H_Cap_grn",
	"CUP_H_C_Ushanka_04",
	"CUP_H_PMC_Cap_Grey",
	"H_Cap_blk_ION",
	"CUP_H_C_Ushanka_01",
	"CUP_H_C_Ushanka_02",
	"H_Cap_oli",
	"H_Cap_oli_hs",
	"CUP_H_C_Ushanka_03",
	"CUP_H_USA_Cap",
	"H_Cap_police",
	"CUP_H_USArmy_Boonie",
	"H_Cap_press",
	"H_Cap_red",
	"TRYK_H_woolhat_WH",
	"H_Cap_surfer",
	"TRYK_H_woolhat_tan",
	"H_Cap_tan",
	"TRYK_H_woolhat_CW",
	"H_Cap_khaki_specops_UK",
	"TRYK_H_woolhat_cu",
	"H_Cap_usblack",
	"TRYK_H_woolhat",
	"TRYK_H_woolhat_br",
	"H_Cap_tan_specops_US",
	"H_Cap_blk_Raven",
	"TRYK_H_wig",
	"H_Cap_brn_SPECOPS",
	"CUP_H_PMC_Cap_Back_Burberry",
	"CUP_H_PMC_Cap_Back_Grey",
	"CUP_H_PMC_Cap_Back_Tan",
	"TRYK_r_cap_tan_Glasses",
	"CUP_H_PMC_Cap_Back_EP_Grey",
	"TRYK_r_cap_od_Glasses",
	"CUP_H_PMC_Cap_Back_EP_Tan",
	"CUP_H_PMC_Cap_Back_PRR_Burberry",
	"TRYK_r_cap_blk_Glasses",
	"CUP_H_PMC_Cap_Back_PRR_Tan",
	"TRYK_R_CAP_OD_US",
	"CUP_H_PMC_Cap_EP_Grey",
	"TRYK_R_CAP_TAN",
	"CUP_H_FR_Cap_Officer_Headset",
	"TRYK_R_CAP_BLK",
	"CUP_H_PMC_EP_Headset",
	"CUP_H_C_Fireman_Helmet_01",
	"TRYK_H_headsetcap_blk_Glasses",
	"H_Hat_blue",
	"H_Hat_brown",
	"H_Hat_camo",
	"H_Hat_checker",
	"H_Hat_tan",
	"TRYK_H_headsetcap_od_Glasses",
	"CUP_H_SLA_Beret",
	"CUP_H_NAPA_Fedora",
	"CUP_H_C_MAGA_01",
	"H_MilCap_blue",
	"H_MilCap_gen_F",
	"TRYK_H_headsetcap_Glasses",
	"TRYK_ESS_CAP_tan",
	"TRYK_ESS_CAP_OD",
	"TRYK_ESS_CAP",
	"CUP_H_ChDKZ_Beret",
	"CUP_H_C_TrackIR_01",
	"H_StrawHat",
	"H_Shemag_olive"
];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_result = "";

if (_item == "uniform") then 
{ 
	_result = _uniforms call BIS_fnc_selectRandom
};

if (_item == "headgear") then { _result = "" };
if (_item == "goggles") then { _result = "" };

_result
