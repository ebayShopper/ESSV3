#define ESS_BUTTON borderSize = 0;\
	colorBackground[] = {.4,.4,.4,1};\
	colorBackgroundActive[] = {.5,.5,.5,1};\
	colorBackgroundDisabled[] = {.2,.2,.2,1};\
	colorBorder[] = {.88,.88,.88,1};\
	colorDisabled[] = {.2,.2,.2,1};\
	colorFocused[] = {.4,.4,.4,1};\
	colorShadow[] = {0,0,0,0};\
	colorText[] = {1,1,1,1};\
	font = "Zeppelin32";\
	offsetPressedX = .002;\
	offsetPressedY = .002;\
	offsetX = .003;\
	offsetY = .003;\
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";\
	soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};\
	soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};\
	soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};\
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};\
	style = 2;\
	type = 1

#define ESS_LISTBOX autoScrollDelay = 5;\
	autoScrollRewind = 0;\
	autoScrollSpeed = -1;\
	colorSelect[] = {.88,.88,.88,1};\
	colorSelectBackground[] = {.5,.5,.5,1};\
	colorText[] = {.88,.88,.88,1};\
	font = "Zeppelin32";\
	maxHistoryDelay = 1;\
	rowHeight = .04;\
	class ScrollBar\
	{\
		color[] = {.5,.5,.5,.5};\
		colorActive[] = {.5,.5,.5,.3};\
		colorDisabled[] = {.5,.5,.5,.1};\
		thumb = "";\
		arrowFull = "\ca\ui\data\arrow_up_ca.paa";\
		arrowEmpty = "\ca\ui\data\arrow_up_ca.paa";\
		border = "\ca\ui\data\ui_border_scroll_ca.paa";\
		shadow = 0;\
	};\
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";\
	soundSelect[] = {"",.1,1};\
	style = 16;\
	type = 5

class ClassDialog
{
	idd = -1;
	onUnload = "deleteVehicle class_bot; deleteVehicle spawn_light;";
	class controlsBackground
	{
		class ClassBackground: RscText
		{
			text = "";
			x = .31 * safezoneW + safezoneX;
			y = .335 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .325 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls
	{
		class ClassSelect: RscText
		{
			text = $STR_ESS_CLASS_SELECT;
			x = .31 * safezoneW + safezoneX;
			y = .295 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .04025 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class ClassList
		{
			idc = 8888;
			x = .31 * safezoneW + safezoneX;
			y = .339 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .25 * safezoneH;
			onLBSelChanged = "call class_preview;";
			ESS_LISTBOX;
		};
		class ClassButton
		{
			idc = 8889;
			text = $STR_USRACT_MENU_SELECT;
			x = .324 * safezoneW + safezoneX;
			y = .602 * safezoneH + safezoneY;
			w = .109 * safezoneW;
			h = .044 * safezoneH;
			action = "call class_pick; if (count class_choice > 0) then {closeDialog 0;};";
			ESS_BUTTON;
		};
	};
};

class HaloDialog
{
	idd = -1;
	class controlsBackground 
	{
		class HaloBackground: RscText
		{
			text = "";
			x = .370287 * safezoneW + safezoneX;
			y = .348822 * safezoneH + safezoneY;
			w = .260299 * safezoneW;
			h = .3 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls
	{
		class HaloSelect: RscText
		{
			text = $STR_ESS_HALO_SELECT;
			x = .370288 * safezoneW + safezoneX;
			y = .299 * safezoneH + safezoneY;
			w = .260299 * safezoneW;
			h = .05 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class HaloAir: RscPicture
		{
			fixedWidth = 0;
			text = "\ca\ui\data\iconplane_ca.paa";
			x = .403107 * safezoneW + safezoneX;
			y = .396064 * safezoneH + safezoneY;
			w = .0738056 * safezoneW;
			h = .0873141 * safezoneH;
		};
		class HaloGround: RscPicture
		{
			fixedWidth = 0;
			text = "\ca\ui\data\icontruck_ca.paa";
			x = .524484 * safezoneW + safezoneX;
			y = .396064 * safezoneH + safezoneY;
			w = .0732848 * safezoneW;
			h = .0868511 * safezoneH;
		};
		class HaloButtonAir
		{
			idc = -1;
			text = $STR_ESS_AIR;
			x = .402585 * safezoneW + safezoneX;
			y = .533 * safezoneH + safezoneY;
			w = .0743267 * safezoneW;
			h = .0877774 * safezoneH;
			action = "halo_choice = 1; closeDialog 0;";
			ESS_BUTTON;
		};
		class HaloButtonGround
		{
			idc = -1;
			text = $STR_ESS_GROUND;
			x = .524484 * safezoneW + safezoneX;
			y = .533 * safezoneH + safezoneY;
			w = .0743267 * safezoneW;
			h = .0877774 * safezoneH;
			action = "halo_choice = 0; closeDialog 0;";
			ESS_BUTTON;
		};
	};
};

class SpawnDialog
{
	idd = 88890;
	onLoad = "uiNamespace setVariable ['BIS_RscMiniMap',_this select 0];"; //Tell groupMarkers to draw while dialog is open
	onUnload = "uiNamespace setVariable ['BIS_RscMiniMap',nil];";
	
	class controlsBackground 
	{
		class SpawnBackground: RscText
		{
			text = "";
			x = .305217 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .4644 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls
	{
		class SpawnSelect: RscText
		{
			text = $STR_ESS_SPAWN_SELECT;
			x = .305218 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .0405354 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class SpawnList
		{
			idc = 8888;
			x = .305217 * safezoneW + safezoneX;
			y = .314737 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .33 * safezoneH;
			onLBSelChanged = "[] spawn spawn_map;";
			ESS_LISTBOX;
		};
		class SpawnButton
		{
			idc = 8889;
			text = $STR_USRACT_MENU_SELECT;
			x = .318 * safezoneW + safezoneX;
			y = .6565 * safezoneH + safezoneY;
			w = .092 * safezoneW;
			h = .067 * safezoneH;
			action = "call spawn_pick; if (count spawn_choice > 0) then {closeDialog 0;};";
			ESS_BUTTON;
		};
		class SpawnMap
		{
			idc = 8890;
			x = .42315 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .293691 * safezoneW;
			h = .463997 * safezoneH;
			moveOnEdges = 0;
			shadow = 0;
			maxSatelliteAlpha = .85;
			alphaFadeStartScale = .35;
			alphaFadeEndScale = .4;
			colorOutside[] = {0,0,0,1};			
			style = 48;
			font = "EtelkaNarrowMediumPro";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			type = 101;
			colorBackground[] = {.8,.8,.8,1};
			colorText[] = {0,0,0,1};
			colorRailway[] = {.5,.5,.5,.5};
			colorSea[] = {.56,.8,.98,.5};
			colorForest[] = {.6,.8,.2,.5};
			colorRocks[] = {.5,.5,.5,.5};
			colorCountlines[] = {.65,.45,.27,.5};
			colorMainCountlines[] = {.65,.45,.27,1};
			colorCountlinesWater[] = {0,.53,1,.5};
			colorMainCountlinesWater[] = {0,.53,1,1};
			colorForestBorder[] = {.4,.8,0,1};
			colorRocksBorder[] = {.5,.5,.5,1};
			colorPowerLines[] = {0,0,0,1};
			colorNames[] = {0,0,0,1};
			colorInactive[] = {1,1,1,.5};
			colorLevels[] = {.286,.177,.094,.5};
			fontLabel = "TahomaB";
			sizeExLabel = .04;
			fontGrid = "TahomaB";
			sizeExGrid = .04;
			fontUnits = "TahomaB";
			sizeExUnits = .04;
			fontNames = "TahomaB";
			sizeExNames = .04;
			fontInfo = "TahomaB";
			sizeExInfo = .04;
			fontLevel = "TahomaB";
			sizeExLevel = .04;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			stickX[] = {.2,{"Gamma",1,1.5}};
			stickY[] = {.2,{"Gamma",1,1.5}};
			ptsPerSquareSea = 6;
			ptsPerSquareTxt = 8;
			ptsPerSquareCLn = 8;
			ptsPerSquareExp = 8;
			ptsPerSquareCost = 8;
			ptsPerSquareFor = "4.0f";
			ptsPerSquareForEdge = "10.0f";
			ptsPerSquareRoad = 2;
			ptsPerSquareObj = 10;
			showCountourInterval = 0;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";				
			class CustomMark {
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0,0,1,1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Bunker {
				icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 1.5 * 14 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Bush {
				icon = "\ca\ui\data\map_bush_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 14;
				importance = .2 * 14 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class BusStop {
				icon = "\ca\ui\data\map_busstop_ca.paa";
				color[] = {0,0,1,1};
				size = 10;
				importance = 1 * 10 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Command {
				icon = "#(argb,8,8,3)color(1,1,1,1)";
				color[] = {0,.9,0,1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Cross {
				icon = "\ca\ui\data\map_cross_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = .7 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Fortress {
				icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Fuelstation {
				icon = "#(argb,8,8,3)color(0,0,0,1)";
				color[] = {0,0,0,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .75;
				coefMax = 4;
			};
			class Fountain {
				icon = "\ca\ui\data\map_fountain_ca.paa";
				color[] = {0,.35,.7,1};
				size = 12;
				importance = 1 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Hospital {
				icon = "\ca\ui\data\map_hospital_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Chapel {
				icon = "\ca\ui\data\map_chapel_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 1 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Church {
				icon = "\ca\ui\data\map_church_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Legend {
				x = "SafeZoneX";
				y = "SafeZoneY";
				w = .34;
				h = .152;
				font = "Zeppelin32";
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
				colorBackground[] = {0,0,0,1};
				color[] = {0,0,0,1};
			};
			class Lighthouse {
				icon = "\ca\ui\data\map_lighthouse_ca.paa";
				color[] = {.78,0,.05,1};
				size = 20;
				importance = 3 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Quay {
				icon = "\ca\ui\data\map_quay_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Rock {
				icon = "\ca\ui\data\map_rock_ca.paa";
				color[] = {0,0,1,1};
				size = 12;
				importance = .5 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Ruin {
				icon = "\ca\ui\data\map_ruin_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 1.2 * 16 * .05;
				coefMin = 1;
				coefMax = 4;
			};
			class SmallTree {
				icon = "\ca\ui\data\map_smalltree_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 12;
				importance = .6 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Stack {
				icon = "\ca\ui\data\map_stack_ca.paa";
				color[] = {0,0,1,1};
				size = 20;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Task {
				icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
				iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
				iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
				iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
				iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
				color[] = {.863,.584,.0,1};
				colorCreated[] = {.95,.95,.95,1};
				colorCanceled[] = {.606,.606,.606,1};
				colorDone[] = {.424,.651,.247,1};
				colorFailed[] = {.706,.0745,.0196,1};
				size = 10;
				coefMin = 1;
				coefMax = 4;
				importance = 1;
			};
			class Tree {
				icon = "\ca\ui\data\map_tree_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 12;
				importance = .9 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Tourism {
				icon = "\ca\ui\data\map_tourism_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 1 * 16 * .05;
				coefMin = .7;
				coefMax = 4;
			};
			class Transmitter {
				icon = "\ca\ui\data\map_transmitter_ca.paa";
				color[] = {0,0,1,1};
				size = 20;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class ViewTower {
				icon = "\ca\ui\data\map_viewtower_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Watertower {
				icon = "\ca\ui\data\map_watertower_ca.paa";
				color[] = {0,.35,.7,1};
				size = 32;
				importance = 1.2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Waypoint {
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class WaypointCompleted {
				icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class ActiveMarker {
				icon = "";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
		};
	};
};
