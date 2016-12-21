;'
} count allDead;
if (!_found) then {deleteMarkerLocal "MyBody";};

_region = createDialog "RscDisplaySpawnSelecter";

_object = (_x select 1) createVehicleLocal [0,0,0];

_selected = lbCurSel _list;

([4654,9595,0] nearestObject 145259) setDamage 1;
([4654,9595,0] nearestObject 145260) setDamage 1;

_lbUsersControl lbSetColor [_x, [1,0,0,1]];

_agent = createAgent [_type, _position, [], _radius, "CAN_COLLIDE"];

_unit setPosAsl [(_position select 0), (_position select 1), (LHA_height+1)];

_this setVehicleInit "this setVectorUp [0,0,1];";
';