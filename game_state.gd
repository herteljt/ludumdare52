extends Node

var has_met_player: bool = false

#Strike Variables
var strike1 = false
var strike2 = false


var left_image_name: String 
var right_image_name: String

#Game State Variable
var title_scene = false
var driving_scene = true
var dossier_scene = false
var end_scene = false

var character: int

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
