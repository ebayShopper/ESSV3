private ["_bag","_class","_female","_model","_name","_offset","_pos","_weps"];
disableSerialization;
#include "scripts.sqf"

_class = class_public select 0;
_name = lbText [8888,(lbCurSel 8888)];
{
	if (_name == (_x select 0)) then {
		_class = _x;
	};
} forEach class_public;

_female = player isKindOf "SurvivorW2_DZ";
_model = if (_female) then {_class select 2} else {_class select 1};
_weps = _class select 4;
_bag = _class select 5;

if (count _class > 20) then { //Random
	_model = if (_female) then {(_class select 1) select 1} else {(_class select 1) select 0};
	_model = _model call BIS_fnc_selectRandom;
	_weps = _class select 6;
	if (count _weps > 0) then {_weps = [(_weps call BIS_fnc_selectRandom)];};
	_bag = _class select 10;
	_bag = if (count _bag > 0) then {_bag call BIS_fnc_selectRandom} else {""};
};

deleteVehicle class_bot;
class_bot = _model createVehicleLocal [0,0,0];
class_bot call class_wipeGear;
{
	if !(_x in weapons class_bot) then {
		class_bot addWeapon _x;
	};
} count _weps;

if (primaryWeapon class_bot == "") then { //Need to use createAgent if no primary to prevent arms glitch
	deleteVehicle class_bot;
	class_bot = createAgent [_model,[0,0,0],[],0,"CAN_COLLIDE"];
	class_bot call class_wipeGear;
};

if (_bag != "") then {class_bot addBackpack _bag;};
class_bot setFace "Face01";
class_bot enableSimulation false;
class_bot setPosATL spawn_cameraPos;
spawn_light lightAttachObject [class_bot,[0,2,.1]];

_pos = getPosASL class_bot;
_offset = [(_pos select 0)+.4,(_pos select 1)+3,(_pos select 2)+.9];

if (surfaceIsWater [_pos select 0,_pos select 1,0]) then {
	spawn_camera setPosASL _offset;
} else {
	spawn_camera setPosATL (ASLtoATL _offset);
};