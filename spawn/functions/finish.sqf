if (player distance respawn_west_original < 100) then {
	// Ground spawn
	player setPosATL _grid;
	if (surfaceIsWater respawn_west_original) then {player call fn_exitSwim;};
	
	// Show infoText if not in HALO spawn
	_nearestCity = nearestLocations [_grid, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000];
	Dayz_logonTown = "Wilderness";
	if (count _nearestCity > 0) then {Dayz_logonTown = text (_nearestCity select 0)};
	[toUpper worldName,Dayz_logonTown,format[localize "str_player_06",Dayz_logonDate]] spawn {
		uiSleep 5;
		BIS_fnc_infoText = compile preprocessFileLineNumbers "ca\modules_e\functions\GUI\fn_infoText.sqf";
		_this spawn BIS_fnc_infoText;
	};
};

spawn_camera cameraEffect ["terminate","back"];
camDestroy spawn_camera;

dayz_enableRules = dayz_enableRulesOriginal;
dayz_maxGlobalAnimals = dayz_maxGlobalAnimalsOriginal;
fnc_usec_damageHandler = fnc_usec_damageHandlerOriginal;
player_spawn_2 = player_spawn_2_original;

dayz_slowCheck = [] spawn player_spawn_2;
if (dayz_enableRules && (profileNamespace getVariable ["streamerMode",0] == 0)) then { dayz_rulesHandle = execVM "rules.sqf"; };