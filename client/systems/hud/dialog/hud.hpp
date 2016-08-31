// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat, [KoS] Bewilderbeest
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

class WastelandHud {
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 1e10;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";

	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + safeZoneW - 0.42;
			y = safeZoneY + safeZoneH - 0.33;
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + safeZoneW - 0.24;
			y = safeZoneY + safeZoneH - 0.28;
			w = 0.22; h = 0.28;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_ActivityIcon:w_RscText
		{
			idc = hud_activity_icon_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.007);
			y = safeZoneY + (safeZoneH * 0.011);
			w = (0.06 * 3/4) * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class WastelandHud_ActivityTextBox:w_RscText
		{
			idc = hud_activity_textbox_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.055);
			y = safeZoneY + (safeZoneH * 0.011);
			w = 0.18 * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 1;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		class WastelandHud_FoodBG: RscPictureGUI
		{
			idc = 1901;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;//2
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_FoodBorder: RscPictureGUI
		{
			idc = hud_food_border_idc;
			text = "client\icons\status\status_food_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;//2
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodBG: RscPictureGUI
		{
			idc = 1900;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY; //3
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodBorder: RscPictureGUI
		{
			idc = hud_blood_border_idc;
			//text = "client\icons\status\status_blood_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY; //3
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstBG: RscPictureGUI
		{
			idc = 1902;
			text = "client\icons\status\status_bg.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY; //1
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstBorder: RscPictureGUI
		{
			idc = hud_thirst_border_idc;
			text = "client\icons\status\status_thirst_border_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY; //1
			w = 0.075;
			h = 0.10;
		};
	};
	class Controls {
		class WastelandHud_FoodInside: RscPictureGUI
		{
			idc = hud_food_inside_idc;
			//text = "client\icons\status\status_food_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_BloodInside: RscPictureGUI
		{
			idc = hud_blood_inside_idc;
			//text = "client\icons\status\status_blood_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.79 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
		class WastelandHud_ThirstInside: RscPictureGUI
		{
			idc = hud_thirst_inside_idc;
			//text = "client\icons\status\status_thirst_inside_ca.paa";
			x = 0.955313 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.075;
			h = 0.10;
		};
	};
};
