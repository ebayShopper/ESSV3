private ["_ctrl","_grid","_name","_spawn","_zoom"];
disableSerialization;
#include "scripts.sqf"

_zoom = 0.35;
_spawn = ["","","","",""];
_name = lbText [8888,(lbCurSel 8888)];
{
	if (_name == (_x select 0)) exitWith {
		_spawn = _x;
	};
} forEach spawn_public;

_grid = switch true do {
	case (_name == (localize "STR_ESS_GROUP")): {getPosATL leader group player};
	case (_name == (localize "STR_ESS_PLOT")): {getPosATL spawn_plot};
	case (count _spawn > 4): {_zoom = 4; getMarkerPos "center"}; //Random or nothing selected
	default {_spawn select 1};
};

if (spawn_mapPos distance _grid > 0) then {
	spawn_mapPos = _grid;
	_ctrl = (findDisplay 88890) displayCtrl 8890;
	
	// Zoom out first (avoids visible flashing)
	if (_grid distance getMarkerPos "center" > 0) then {
		ctrlMapAnimClear _ctrl;
		_ctrl ctrlMapAnimAdd [1,.6,_grid];
		ctrlMapAnimCommit _ctrl;
		waitUntil {ctrlMapAnimDone _ctrl};
	};

	// Zoom in to location
	ctrlMapAnimClear _ctrl;
	_ctrl ctrlMapAnimAdd [2,_zoom,_grid];
	ctrlMapAnimCommit _ctrl;
};