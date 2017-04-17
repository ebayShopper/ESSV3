private ["_bag","_bmags","_bmags2","_bmags3","_bpistol","_btools","_bweps","_coins","_dir","_female",
"_gMags","_grid","_gTools","_haloJump","_handle","_isPZombie","_leader","_mags","_mags2","_mags3","_main","_model",
"_muzzle","_myModel","_nearestCity","_onBack","_oldGroup","_plane","_pos","_savedGroup","_tools","_unit","_wealth","_weps"];

waitUntil {uiSleep 0.4; (!isNil "PVCDZ_plr_Login2" && {count PVCDZ_plr_Login2 > 0})};

//Stop infoText showing until after selection is done
BIS_fnc_infoText = {};

// Worldspace from vanilla spawn selection or server_playerSetup
_grid = (PVCDZ_plr_Login2 select 2) select 1;

spawn_cameraPos = [(random 99999),(random 99999),99999];
spawn_camera = "camera" camCreate spawn_cameraPos;
spawn_camera cameraEffect ["external","back"];
spawn_camera camSetFOV 0.7;
spawn_camera camCommit 0;
waitUntil {camCommitted spawn_camera};
spawn_camera setDir 180;

sched_townGenerator_ready = {true};
waitUntil {uiSleep 0.4; !isNil "Dayz_loginCompleted"};

//Exit if not a fresh spawn
if !(PVCDZ_plr_Login2 select 3) exitWith {
	#include "functions\finish.sqf"
	#include "functions\cleanup.sqf"
};

_isPZombie = player isKindOf "PZombie_VB";

//Add private classes and spawns this player has access to.
spawn_config = PVCDZ_plr_Login2 select 4;
class_public = (spawn_config select 0) + class_public;
spawn_public = (spawn_config select 1) + spawn_public;

//VIP levels this player has access to.
class_levels = spawn_config select 2;
spawn_levels = spawn_config select 3;

waitUntil {uiSleep 0.1; !isNull findDisplay 46};
0 fadeSound 0;
0 fadeMusic 0;
#include "functions\scripts.sqf"

if (class_selection && !_isPZombie) then {
	class_bot = objNull;
	class_choice = [];
	
	// Make preview bot visible at night time
	spawn_light = "#lightpoint" createVehicleLocal [0,0,0];
	spawn_light setLightBrightness 300;
	spawn_light setLightAmbient [1,1,1];
	spawn_light setLightColor [1,1,1];
	
	createDialog "ClassDialog";
	call class_fillList;
	call class_preview;
	waitUntil {uiSleep 0.1; !dialog};
	
	_bag = "";
	_bmags = [];
	_bweps = [];
	_mags = [];
	_weps = [];
	_onBack = "";
	
	if (count class_choice > 0) then {
		player call class_wipeGear;
		_myModel = typeOf player;
		_female = _myModel isKindOf "SurvivorW2_DZ";
		_model = if (_female) then {class_choice select 2} else {class_choice select 1};
		_mags = class_choice select 3;
		_weps = class_choice select 4;
		_bag = class_choice select 5;
		_bmags = class_choice select 6;
		_bweps = class_choice select 7;
		_onBack = switch true do {
			case (count class_choice == 10): {class_choice select 9}; //Custom loadout by UID
			case (count class_choice == 12): {class_choice select 11}; //Normal private or public
			default {""}; //Not specified, may be V2 config
		};
	
		if (typeName _model == "ARRAY") then { //Random
			_model = if (_female) then {(class_choice select 1) select 1} else {(class_choice select 1) select 0};
			_model = _model call BIS_fnc_selectRandom;
			_weps = class_choice select 6;
			_pistol = class_choice select 8;
			_bag = class_choice select 10;
			_bweps = class_choice select 15;
			_bpistol = class_choice select 17;
			_onBack = if (count class_choice > 22) then {class_choice select 22} else {[]};
			_gMags = if (count class_choice > 23) then {class_choice select 23} else {[]};
			_gTools = if (count class_choice > 24) then {class_choice select 24} else {[]};
			_bag = if (count _bag > 0) then {_bag call BIS_fnc_selectRandom} else {""};
			_onBack = if (count _onBack > 0) then {_onBack call BIS_fnc_selectRandom} else {""};
			if (count _weps > 0) then {_weps = [(_weps call BIS_fnc_selectRandom)];};
			if (count _pistol > 0) then {_pistol = [(_pistol call BIS_fnc_selectRandom)];};
			if (count _bweps > 0) then {_bweps = [(_bweps call BIS_fnc_selectRandom)];};
			if (count _bpistol > 0) then {_bpistol = [(_bpistol call BIS_fnc_selectRandom)];};
			_tools = 4 call class_randomTools;
			_btools = 13 call class_randomTools;		
			_bmags = [(class_choice select 11),11,12] call class_randomMags;
			_bmags2 = [_bweps,16] call class_randomMags;
			_bmags3 = [_bpistol,18] call class_randomMags;
			_mags = [(class_choice select 2),2,3] call class_randomMags;
			_mags2 = [_weps,7] call class_randomMags;
			_mags3 = [_pistol,9] call class_randomMags;
			_mags = _mags + _mags2 + _mags3 + _gMags;
			_bmags = _bmags + _bmags2 + _bmags3;
			_bweps = _bweps + _btools + _bpistol;
			_weps = _weps + _pistol + _tools + _gTools;
		};

		if (_model != _myModel) then {
			gear_done = false;
			if (!isNil "player_countMagazinesWBackpack") then { //Skip ammo count. Player has no gear yet.
				player_countMagazinesWBackpackOriginal = player_countMagazinesWBackpack;
				player_countMagazinesWBackpack = {[[],[]]};
			};
			_handle = [dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
			uiSleep 0.2;
			waitUntil {scriptDone _handle};
			gear_done = true;
			player_countMagazinesWBackpack = player_countMagazinesWBackpackOriginal;
			player call class_wipeGear;
		};
	};
	
	[_mags,1,player] call class_fillItems;
	{player addWeapon _x} count _weps;
	
	if (_bag != "") then {
		player addBackpack _bag;
		_bag = unitBackpack player;
		[_bmags,2,_bag] call class_fillItems;
		[_bweps,3,_bag] call class_fillItems;
	};
	
	if (_onBack != "") then {dayz_onBack = _onBack;};
	
	_main = primaryWeapon player;
	if (_main == "") then {
		{
			if (getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 2) then {_main = _x;};
		} count (weapons player);
	};
	
	_muzzle = getArray (configFile >> "CfgWeapons" >> _main >> "muzzles");
	if (count _muzzle > 1) then {
		player selectWeapon (_muzzle select 0);
	} else {
		player selectWeapon _main;
	};
	
	_coins = switch true do {
		case (count class_choice > 20): {class_choice select 21}; //Random
		case (count class_choice > 10): {class_choice select 10}; //Normal public or private
		case (count class_choice > 0): {class_choice select 8}; //Custom loadout by UID
		default {0};
	};

	_wealth = player getVariable [Z_MoneyVariable,0];
	if (_wealth < _coins) then {
		player setVariable [Z_MoneyVariable,(_wealth + _coins),true];
	};
};

if (spawn_selection) then {
	dayz_spawnselection = 1; //Set on now, so journal shows correct value
	spawn_choice = [];
	spawn_mapPos = [0,0,0];
	createDialog "SpawnDialog";
	call spawn_fill;
	[] spawn spawn_map;
	waitUntil {uiSleep 0.1; !dialog};
	if (count spawn_choice == 0) exitWith {};

	_grid = spawn_choice select 1;
	if (count spawn_choice > 3) then {
		_grid = switch true do {
			case (count spawn_choice > 4): {_grid call BIS_fnc_selectRandom};
			case (count _grid == 0): {getPosATL leader group player};
			case (count _grid == 1): {getPosATL spawn_plot};
			default {_grid};
		};
		if (surfaceIsWater _grid) then {_grid = ATLToASL _grid;};
		
		for "_i" from 0 to 99 do {
			_pos = [_grid,0,spawn_radius,10,0,2000,0] call BIS_fnc_findSafePos;
			_pos set [2,0];
			if (
				((ATLtoASL _pos) select 2) > 2.5
				&& {(_pos distance _grid) < spawn_radius}
				&& {({isPlayer _x} count (_pos nearEntities ["CAManBase",100])) == 0}
				&& {count (_pos nearEntities ["Plastic_Pole_EP1_DZ",45]) == 0}
			) exitWith {_grid = _pos;};
		};
	};
};

preloadCamera _grid;
player switchMove "";

if ((halo_selection or halo_force) && !_isPZombie) then {
	halo_choice = -1;
	
	if (halo_force) then {
		halo_choice = 1;
	} else {
		createDialog "HaloDialog";
		waitUntil {uiSleep 0.1; !dialog};
	};
	
	if (halo_choice == 1) then {
		if (halo_type == "") then {
			player setPosATL [_grid select 0,_grid select 1,DZE_HaloSpawnHeight];
			[player,DZE_HaloSpawnHeight] spawn BIS_fnc_halo;
		} else {
			_haloJump = DZE_HaloJump; //Store original value
			DZE_HaloJump = false; //Disable temporarily so player can not jump early
			_pos = [(_grid select 0)+1000,(_grid select 1)+1000,DZE_HaloSpawnHeight];
			_plane = halo_type createVehicleLocal _pos;
			_plane engineOn true;
			_plane setPosATL _pos;
			clearWeaponCargo _plane;
			clearMagazineCargo _plane;
			_plane setVehicleLock "LOCKED";
			_plane flyInHeight DZE_HaloSpawnHeight;
			_dir = [_pos,_grid] call BIS_fnc_dirTo;
			_plane setDir (90 - _dir); 
			_plane setVelocity [50*(sin _dir),50*(cos _dir),0];
			_unit = createAgent ["Survivor2_DZ",_grid,[],0,"CAN_COLLIDE"];
			_unit assignAsDriver _plane;
			_unit moveInDriver _plane;
			player reveal _plane;
			player moveInCargo [_plane,2];
			player action ["getInCargo",_plane,2];
			_pos = group player addWaypoint [_grid,0];
			[_grid,_plane,_unit,_pos,_haloJump] spawn {
				#include "functions\scripts.sqf"
				_plane = _this select 1;
				_plane setDamage .8;
				waitUntil {_plane distance (_this select 0) < (DZE_HaloSpawnHeight + 200)};
				player spawn BIS_fnc_halo;
				player action ["eject",_plane];
				player setVelocity [(velocity player) select 0,(velocity player) select 1,-15];
				uiSleep 25;
				deleteVehicle _plane;
				deleteVehicle (_this select 2);
				deleteWayPoint (_this select 3);
				DZE_HaloJump = _this select 4; //Reset to original value
			};
		};
	};
};

#include "functions\finish.sqf"
3 fadeSound 1;
3 fadeMusic 1;
#include "functions\cleanup.sqf"
call player_forceSave; //Save in case server shuts down or player is kicked before opening gear or abort menu