private ["_amount","_item","_items","_object","_type"];

_items = _this select 0;
_type = _this select 1;
_object = _this select 2;

{
	_item = _x;
	
	if (typeName _item == "STRING") then {
		_amount = _items select (_forEachIndex + 1);
		
		if (isNil "_amount" or {typeName _amount == "STRING"}) then {
			_amount = 1;
		};
		
		if (dayz_classicBloodBagSystem) then {
			if (_item in dayz_typedBags) then { _item = "ItemBloodbag" };
		} else {
			if (_item == "ItemBloodbag") then { _item = "bloodBagONEG" }; // Convert ItemBloodbag into universal blood type/rh bag
		};
		
		switch _type do {
			case 1: { for "_i" from 1 to _amount do {_object addMagazine _item}; };
			case 2: { _object addMagazineCargoGlobal [_item,_amount]; };
			case 3: { _object addWeaponCargoGlobal [_item,_amount]; };
		};
	};
} forEach _items;