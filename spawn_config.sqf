/*
	ESSV3 Server Side Config
	
	For detailed information about these variables see:
	https://github.com/ebayShopper/ESSV3/DOCUMENTATION.MD
*/
class_level1 = ["0","0","0"];
class_level2 = ["0","0","0"];
class_level3 = ["0","0","0"];
// To give higher level VIPs access to lower level VIP classes uncomment the two lines below:
// class_level1 = class_level1 + class_level2 + class_level3;
// class_level2 = class_level2 + class_level3;

#define VIP_ITEMS "HandRoadFlare","ItemBandage",2,"ItemPainkiller","ItemWaterbottle","FoodPistachio","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemMorphine" // constant example, these can be removed if they are not used below
#define VIP_TOOLS "Binocular_Vector","NVGoggles","ItemCompass","ItemKnife","Itemmatchbox","Itemetool","ItemFlashlightRed","ItemWatch","ItemGPS"
class_private = [ // These are only visible to players in their respective class levels
	["VIP Scout","Camo1_DZ","SurvivorW2_DZ",["30Rnd_556x45_Stanag",2,"15Rnd_9x19_M9SD",3,VIP_ITEMS],["M16A4_ACOG_DZ","M9_SD_DZ","Binocular_Vector"],"DZ_ALICE_Pack_EP1",[],[],1,0,0,"MeleeHatchet"],
	["VIP Specialist","Rocket_DZ","SurvivorW2_DZ",["100Rnd_762x51_M240",2,"15Rnd_9x19_M9SD",3,VIP_ITEMS],["Mk48_CCO_DZ","M9_SD_DZ","Binocular_Vector"],"DZ_British_ACU",[],[],2,0,0,"MeleeHatchet"],
	["VIP Sniper","Sniper1_DZ","SurvivorW2_DZ",["20Rnd_762x51_DMR",2,"15Rnd_9x19_M9SD",3,VIP_ITEMS],["DMR_DZ","M9_SD_DZ","Binocular_Vector"],"DZ_Backpack_EP1",[],[],3,0,0,"MeleeHatchet"]
];
class_customLoadout = [
	"76561198014219874", // ebay
	"0",
	"0"
];
class_customLoadouts = [ // These are only visible to their owner
	["ebay's Loadout","Bandit1_DZ","BanditW1_DZ",["100Rnd_762x51_M240",2,"15Rnd_9x19_M9SD",3,"Skin_Sniper1_DZ",VIP_ITEMS],["Mk48_CCO_DZ","M9_SD_DZ",VIP_TOOLS],"DZ_Backpack_EP1",["20Rnd_762x51_DMR",3],["DMR_DZ"],0,"MeleeHatchet"],
	[],
	[]
];

spawn_level1 = ["0","0","0"];
spawn_level2 = ["0","0","0"];
spawn_level3 = ["0","0","0"];
// To give higher level VIPs access to lower level VIP spawns uncomment the two lines below:
// spawn_level1 = spawn_level1 + spawn_level2 + spawn_level3;
// spawn_level2 = spawn_level2 + spawn_level3;

spawn_private = [ // These are only visible to players in their respective spawn levels
	//["VIP Base",[1607,7804,0],1,0],
	//["VIP Hideout",[12944,12767,0],2,0]
];
spawn_base = [
	"76561198014219874", // ebay
	"0",
	"0"
];
spawn_bases = [
	["ebay's base",[2300,15324,0]],
	[],
	[]
];




/*
	The function below returns all private classes and spawns the player has access to.
	The player is sent this data when they respawn.
*/
respawn_west_original = getMarkerPos "respawn_west"; //Temporary until 1.0.6.1/1.8.8.1 release
spawn_config = {
	private ["_classes","_classLevel","_freshSpawn","_index","_playerUID","_return","_spawnLevel","_spawns"];
	
	_freshSpawn = _this select 0;
	_playerUID = _this select 1;
	
	if (!_freshSpawn) exitWith {false};
	_return = [[],[]];
	
	_index = class_customLoadout find _playerUID;
	if (_index != -1) then {
		_classes = _return select 0;
		_classes set [0,(class_customLoadouts select _index)];
		_return set [0,_classes];
	};
	
	_index = spawn_base find _playerUID;
	if (_index != -1) then {
		_spawns = _return select 1;
		_spawns set [0,(spawn_bases select _index)];
		_return set [1,_spawns];
	};
	
	{
		_classLevel = _x select 8;
		if (_playerUID in (call compile format["class_level%1",_classLevel])) then {
			_classes = _return select 0;
			_classes set [count _classes,_x];
			_return set [0,_classes];
		};
	} forEach class_private;
	
	{
		_spawnLevel = _x select 2;
		if (_playerUID in (call compile format["spawn_level%1",_spawnLevel])) then {
			_spawns = _return select 1;
			_spawns set [count _spawns,_x];
			_return set [1,_spawns];
		};
	} forEach spawn_private;
	
	_return
};

if !(isClass (configFile >> "CfgWeapons" >> "Chainsaw")) then {
	//Allow extra skins in vanilla
	AllPlayers = AllPlayers + [
		"Citizen3","CZ_Soldier_DES_EP1","Rocket_DZ","TK_INS_Soldier_EP1",
		"US_Soldier_EP1","Villager1","Worker1"
	];
};