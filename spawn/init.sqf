#include "config.sqf"

dayz_enableRulesOriginal = dayz_enableRules;
dayz_enableRules = false; //Stop rules feed showing until after selection is done
dayz_maxGlobalAnimalsOriginal = dayz_maxGlobalAnimals;
dayz_maxGlobalAnimals = 0; //Stop client spawning animals until after selection is done
fnc_usec_damageHandlerOriginal = fnc_usec_damageHandler;
fnc_usec_damageHandler = {}; //Stop damage until after selection is done
dayz_paraSpawn = false; //Disable stock HALO spawn

//Temporary until 1.0.6.1/1.8.8.1 release
dayz_typedBags = ["bloodTester","bloodBagANEG","bloodBagAPOS","bloodBagBNEG","bloodBagBPOS","bloodBagABNEG","bloodBagABPOS","bloodBagONEG","bloodBagOPOS","wholeBloodBagANEG","wholeBloodBagAPOS","wholeBloodBagBNEG","wholeBloodBagBPOS","wholeBloodBagABNEG","wholeBloodBagABPOS","wholeBloodBagONEG","wholeBloodBagOPOS"];
respawn_west_original = getMarkerPos "respawn_west";

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