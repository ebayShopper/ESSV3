removeBackpack _this;
removeAllItems _this;
removeAllWeapons _this;
{_this removeMagazine _x} count (magazines _this);

if (_this == player) then {
	dayz_onBack = "";
} else {
	_this switchMove "";
};