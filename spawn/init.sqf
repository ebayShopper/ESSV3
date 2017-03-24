class_epoch = isClass (configFile >> "CfgWeapons" >> "Chainsaw");
#include "config.sqf"

// Stop rules feed, animal spawning, damage and slow loop until after selection is done
dayz_enableRulesOriginal = dayz_enableRules;
dayz_enableRules = false;
dayz_maxGlobalAnimalsOriginal = dayz_maxGlobalAnimals;
dayz_maxGlobalAnimals = 0;
fnc_usec_damageHandlerOriginal = fnc_usec_damageHandler;
fnc_usec_damageHandler = {};
player_spawn_2_original = player_spawn_2;
player_spawn_2 = {};

dayz_paraSpawn = false; //Disable stock HALO spawn

//Temporary until 1.0.6.2 and 1.8.9 release
fn_exitSwim = compile preprocessFileLineNumbers "spawn\functions\fn_exitSwim.sqf";

if (!class_epoch) then { //Undefined variables in vanilla
	dayz_typedBags = ["bloodTester","bloodBagANEG","bloodBagAPOS","bloodBagBNEG","bloodBagBPOS","bloodBagABNEG","bloodBagABPOS","bloodBagONEG","bloodBagOPOS","wholeBloodBagANEG","wholeBloodBagAPOS","wholeBloodBagBNEG","wholeBloodBagBPOS","wholeBloodBagABNEG","wholeBloodBagABPOS","wholeBloodBagONEG","wholeBloodBagOPOS"];
	respawn_west_original = getMarkerPos "respawn_west";
	DZE_HaloJump = false;
	DZE_HaloSpawnHeight = 2000;
	FNC_GetPos = {
		private "_pos";
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if !(surfaceIsWater _pos) then {_pos =  ASLToATL _pos;};
		_pos
	};
};

if (spawn_selection) then {
	dayz_spawnselection = 0; //Skip vanilla spawn selection
	spawn_fill = compile preprocessFileLineNumbers "spawn\functions\spawn_fill.sqf";
	spawn_map = compile preprocessFileLineNumbers "spawn\functions\spawn_map.sqf";
	spawn_pick = compile preprocessFileLineNumbers "spawn\functions\spawn_pick.sqf";
};

if (class_selection) then {
	class_fillItems = compile preprocessFileLineNumbers "spawn\functions\class_fillItems.sqf";
	class_fillList = compile preprocessFileLineNumbers "spawn\functions\class_fillList.sqf";
	class_pick = compile preprocessFileLineNumbers "spawn\functions\class_pick.sqf";
	class_preview = compile preprocessFileLineNumbers "spawn\functions\class_preview.sqf";
	class_randomMags = compile preprocessFileLineNumbers "spawn\functions\class_randomMags.sqf";
	class_randomTools = compile preprocessFileLineNumbers "spawn\functions\class_randomTools.sqf";
	class_wipeGear = compile preprocessFileLineNumbers "spawn\functions\class_wipeGear.sqf";
};

execVM "spawn\main.sqf";