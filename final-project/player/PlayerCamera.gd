extends Camera

onready var aim : RayCast = $Aim
onready var weapons : Spatial = $Weapons

export var mouse_sensitivity := 0.5
export var max_pitch := 45.0

var pitch := 0
var selected_weapon_index := 0


func _ready() -> void:
	weapons.initialize(aim)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		pitch = clamp(pitch - event.relative.y * mouse_sensitivity, - max_pitch, max_pitch)
		rotation.x = deg2rad(pitch)
	