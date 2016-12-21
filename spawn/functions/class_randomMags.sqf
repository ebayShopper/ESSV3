private ["_amount","_index","_magazines","_return","_weapons"];

_weapons = _this select 0;
_index = _this select 1;
_return = [];

if (count _weapons > 0) then {
	if (count _this < 3) then {
		_magazines = getArray (configFile >> "CfgWeapons" >> (_weapons select 0) >> "magazines");
		if (count _magazines > 0) then {
			for "_i" from 1 to (class_choice select _index) do {
				_return set [count _return,(_magazines select 0)];
			};
		};
	} else { //Random
		while {({typeName _x == "STRING"} count _return) < (class_choice select (_this select 2))} do {
			_index = _weapons call BIS_fnc_randomIndex;
			_magazines = _weapons select _index;
			if (typeName _magazines == "STRING" && {!(_magazines in _return)}) then {
				_return set [count _return,_magazines];
				_amount = _weapons select (_index + 1);
				if (isNil "_amount" or {typeName _amount == "STRING"}) then {
					_amount = 1;
				};
				_return set [count _return,_amount];
			};
		};
	};
};

_return