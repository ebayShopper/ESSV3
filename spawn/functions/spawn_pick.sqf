private ["_block","_hlevel","_humanity","_level","_name","_spawn"];
disableSerialization;
#include "scripts.sqf"

_block = false;
_spawn = [];

_name = lbText [8888,(lbCurSel 8888)];
{
	if (_name == (_x select 0)) then {
		_spawn = _x;
	};
} forEach spawn_public;

if (_name == (localize "STR_ESS_GROUP")) then {_spawn = [0,[],0,0];};
if (_name == (localize "STR_ESS_PLOT")) then {_spawn = [0,[1],0,0];};

if (count _spawn == 0) exitWith {
	systemChat localize "STR_ESS_NOTHING_SELECTED";
};

if (count _spawn > 2) then {
	_level = _spawn select 2;
	_hlevel = _spawn select 3;
	_humanity = player getVariable ["humanity",0];
	
	_block = switch true do {
		case (_hlevel < 0 && _humanity >= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_HIGH",_hlevel]; true};
		case (_hlevel > 0 && _humanity <= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_LOW",_hlevel]; true};
		case (_level > 0 && !(_level in spawn_levels)): {systemChat format[localize "STR_ESS_NEED_SVIP",_level]; true};
		default {false};
	};
};

if (!_block) then {
	spawn_choice = _spawn;
};