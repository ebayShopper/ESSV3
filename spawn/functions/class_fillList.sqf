private ["_hlevel","_humanity","_index","_level","_lock"];
disableSerialization;
#include "scripts.sqf"

_humanity = player getVariable ["humanity",0];

lbClear 8888;
{
	switch true do {
		case (count _x > 20): { // Random
			_level = _x select 19;
			_hlevel = _x select 20;
		};
		case (count _x > 10): { // Normal public or private
			_level = _x select 8;
			_hlevel = _x select 9;
		};
		default { // Custom loadout by UID
			_level = 0;
			_hlevel = 0;
		};
	};
	
	_lock = (_hlevel < 0 && _humanity >= _hlevel) or (_hlevel > 0 && _humanity <= _hlevel) or (_level > 0 && !(_level in class_levels));
	_index = lbAdd [8888,(_x select 0)];
	
	if (_lock) then {
		lbSetPicture [8888,_index,"\ca\ui\data\ui_task_failed_ca.paa"];
	} else {
		lbSetPicture [8888,_index,"\ca\ui\data\ui_task_done_ca.paa"];
	};
	
	lbSetColor [8888,_index, switch true do {
		case (_level > 0): {[0,1,0,.8]};
		case (_hlevel > 0): {[.38,.7,.9,1]};
		case (_hlevel < 0): {[1,0,0,1]};
		case (count _x > 20): {[.97,.87,.35,1]}; //Random
		default {[.88,.88,.88,1]};
	}];
} forEach class_public;