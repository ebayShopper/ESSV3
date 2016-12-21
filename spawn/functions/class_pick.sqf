private ["_block","_class","_hlevel","_humanity","_name"];
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

_hlevel = switch true do {
	case (count _class > 20): {_class select 20}; // Random
	case (count _class > 10): {_class select 9}; // Normal public or private
	default {0}; // Custom loadout by UID
};

_humanity = player getVariable ["humanity",0];

_block = switch true do {
	case (_hlevel < 0 && _humanity >= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_HIGH",_hlevel]; true};
	case (_hlevel > 0 && _humanity <= _hlevel): {systemChat format[localize "STR_ESS_HUMANITY_TOO_LOW",_hlevel]; true};
	default {false};
};

if (!_block) then {
	class_choice = _class;
};