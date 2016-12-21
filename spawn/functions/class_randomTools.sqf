private ["_tool","_tools","_type"];

_type = _this;
_tools = class_choice select _type;

if (count _tools > 0) then {
	_tools = [];
	while {count _tools < (class_choice select (_type + 1))} do {
		_tool = (class_choice select _type) call BIS_fnc_selectRandom;
		if !(_tool in _tools) then {
			_tools set [count _tools,_tool];
		};
	};
};

_tools