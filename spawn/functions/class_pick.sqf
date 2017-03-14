private ["_block","_class","_hlevel","_humanity","_level","_name"];
disableSerialization;
#include "scripts.sqf"

_class = [];
_name = lbText [8888,(lbCurSel 8888)];
{
	if (_name == (_x select 0)) then {
		_class = _x;
	};
} forEach class_public;

if (count _class == 0) exitWith {
	systemChat localize "STR_ESS_NOTHING_SELECTED";
};

switch true do {
	case (count _class > 20): { // Random
		_level = _class select 19;
		_hlevel = _class select 20;
	};
	case (count _class > 10): { // Normal public or private
		_level = _class select 8;
		_hlevel = _class select 9;
	};
	default { // Custom loadout by UID
		_level = 0;
		_hlevel = 0;
	};
};

_humanity = player getVariable ["humanity",0];

_block = switch true do {
	case (_hlevel < 0 && _humanity >= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_HIGH",_hlevel]; true};
	case (_hlevel > 0 && _humanity <= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_LOW",_hlevel]; true};
	case (_level > 0 && !(_level in class_levels)): {systemChat format[localize "STR_ESS_NEED_CVIP",_level]; true};
	default {false};
};

if (!_block) then {
	class_choice = _class;
};