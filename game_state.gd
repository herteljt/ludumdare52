extends Node

var tutorial: int

#Strike Variables
var strike1: int
var strike2: int

#tutorial vars
var question1: int
var question2: int
var question3: int
var questionsasked: int

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
var difficulty: int
var end_car_color: int

#Character variables
var generic: int = 0
var mike: int = 1
var guy: int = 2
var cecilia: int = 3
var junie: int = 4
var narrator: int = 9

#Mike Dialogue Variable

var altright_mike: int 
var angryalt_mike: int 
var altright2_mike: int 

var familyman_mike: int
var angryfamily_mike: int 

var community_mike: int 
var community2_mike: int 
var ithoughtallmortals: int
var wouldyourpetty: int

var angrycommunity_mike: int 
var daughtercomplain: int
var whydontvisit: int 
var whataboutwife: int

var altrightpath: int
var familypath: int
var communitypath: int
var firstchoice: int

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
