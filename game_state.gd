extends Node

var has_met_player: bool = false

#Strike Variables
var strike1 = false
var strike2 = false


var left_image_name: String 
var right_image_name: String

#Game State Variable
var title_scene: bool
var driving_scene: bool
var talking_scene: bool
var dossier_scene: bool
var HUD: bool
var end_scene = false

var character_selected: int
var character_left_dossier: int
var character_right_dossier: int

var score: int
var score_change: bool
var score_change_amount: int


#comment

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
