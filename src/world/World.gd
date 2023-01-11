extends Node2D

onready var scene_vars = get_node("/root/GameState")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var debug: int
var scenedebug:int
var start: int
var tutorial: int = 0


#var altright2_mike: int
#
#var familyman_mike: int
#var angryfamily_mike: int
#var community_mike: int
#var community2_mike: int
#var angrycommunity_mike: int
#var daughtercomplain: int
#var whydontvisit: int

#comment
func new_game():
	scene_vars.title_scene = true
	scene_vars.driving_scene = false
	scene_vars.talking_scene = false
	scene_vars.dossier_scene = false
	scene_vars.HUD = false
	scene_vars.end_scene = false
	
	$HUD.update_score(0,-1)
#
func game_over():
#	$HUD.show_game_over()
	$Music.stop()
#	$DeathSound.play()


# Called when the node enters the scene tree for the first time.
func _ready():
	scene_vars.score = 0

	scene_vars.title_scene = true
	
	scene_vars.driving_scene = false
	$DrivingScene.visible = false
	scene_vars.talking_scene = false
	$TalkingScene.visible = false
	scene_vars.dossier_scene = false
	$DossierScene.visible = false
	scene_vars.HUD = false
	$HUD.visible = false
	scene_vars.end_scene = false
	$EndScene.visible = false
	

	#var resource = preload("res://assets/dialogue/tutorial.tres")

#	DialogueManager.show_example_dialogue_balloon(\
#	"testing_node", \
#	resource
	#)
	
	
	scene_vars.strike1 = 0
	scene_vars.strike2 = 0
	start = 0
	debug = 0
	scenedebug = 0
	scene_vars.difficulty = 10
#	change_scene()
	
	scene_vars.altrightpath = 0
	scene_vars.familypath = 0
	scene_vars.communitypath = 0
	scene_vars.firstchoice = 0
	

	$TitleMusic.play()
	

#Function to update HUD score and strikes
func update_score(score_change, strike): 
	scene_vars.score = scene_vars.score + score_change
	$HUD.update_score(scene_vars.score)
	if strike == -1:
		scene_vars.strike1 = 0
		scene_vars.strike2 = 0
		$HUD/Strike1.visible = false
		$HUD/Strike2.visible = false
		scene_vars.score = 0
		$HUD.update_score(scene_vars.score)
		print("Strikes and score reset")

	if strike == -2: #only reset strikes
		scene_vars.strike1 = 0
		scene_vars.strike2 = 0
		$HUD/Strike1.visible = false
		$HUD/Strike2.visible = false
		print("Strikes reset")

	if strike == 1 and scene_vars.strike1 == 1:
		scene_vars.strike2 = 1
		$HUD/Strike2.visible = true
		print("Strike 2")
	
	if strike == 1 and scene_vars.strike1 == 0:
		scene_vars.strike1 = 1
		$HUD/Strike1.visible = true
		print("Strike 1")
	

#Function to keep track of dialogue paths
func update_paths():
	print("FirstChoice Value Start:"+str(scene_vars.firstchoice))
	
	if scene_vars.altrightpath == 1 and scene_vars.familypath == 1 and scene_vars.communitypath == 1:
		scene_vars.firstchoice = 1
		print("First Choice Locked")
	else:
		scene_vars.firstchoice = 0
		print("First Choice Open")
		print("FirstChoice Value End:"+str(scene_vars.firstchoice))

func update_tutorial():
	print("Questions Asked Value Start:"+str(scene_vars.questionsasked))
	
	if scene_vars.question1 == 1 and scene_vars.question2 == 1 and scene_vars.question3 == 1:
		scene_vars.questionsasked = 1
		print("Tutorial Locked")
	else:
		scene_vars.questionsasked = 0
		print("Tutorial OPen")
		print("FirstChoice Value End:"+str(scene_vars.questionsasked))



func change_scene():
	if scene_vars.title_scene == true:
#		print("Title Scene Enabled")
		$TitleScene.visible = true
		$TalkingScene.visible = false
		$DrivingScene.visible = false
		$HUD.visible = false
		$DossierScene.visible = false
		$EndScene.visible = false
		$TitleMusic.play()
	if scene_vars.driving_scene == true:
#		print("Driving Scene Enabled")
		$DrivingScene.visible = true
		$DossierScene.visible = false
		$TitleMusic.stop()

	if scene_vars.talking_scene == true:
#		print("Talking Scene Enabled")
		$DrivingScene.visible = true
		$TalkingScene.visible = true
		$DossierScene.visible = false
		if scene_vars.character_selected == scene_vars.generic:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.generic)
		if scene_vars.character_selected == scene_vars.mike:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.mike)
		if scene_vars.character_selected == scene_vars.mike:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.mike)
		if scene_vars.character_selected == scene_vars.guy:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.guy)
		if scene_vars.character_selected == scene_vars.junie:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.junie)
		if scene_vars.character_selected == scene_vars.narrator:
			$TalkingScene/CharacterSprite.animation="talk_"+str(scene_vars.narrator)
	if scene_vars.dossier_scene == true:
#		print("Dossier Scene Enabled")
		$DossierScene.visible = true
		$HUD.visible = false
		$DossierScene/LeftSprite.animation="char_"+str(scene_vars.character_left_dossier)
		$DossierScene/RightSprite.animation="char_"+str(scene_vars.character_right_dossier)
	if scene_vars.HUD == true:
#		print("HUD Enabled")
		$HUD.visible = true
		$DossierScene.visible = false
	if scene_vars.end_scene == true:
#		print("End Scene Enabled")
		$EndScene/EndSprite.animation="end_"+str(scene_vars.end_car_color)
		$Music.stop()
		$EndScene.visible = true
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_tutorial"):
		if tutorial == 1:
			tutorial = 3
		if start == 0:
			tutorial = 1
		if start == 1:
			tutorial = 0
	print("Tutorial Value: "+str(tutorial))
		

	if Input.is_action_just_pressed("ui_start"):
		if start == 1:
			start = 3
		if tutorial == 1:
			start = 0
		if tutorial == 0:
			start = 1
	print("Start Value: "+str(start))

	if start == 0 and tutorial == 1:
		var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
		DialogueManager.show_example_dialogue_balloon(\
		"tutorial", \
		dialogue_balloon)
		start = 2
		scene_vars.title_scene = false	
		scene_vars.driving_scene = true	
		$TitleMusic.stop()
		$Music.play()
		change_scene()
		
	if start == 1 and tutorial == 0:
		var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
		DialogueManager.show_example_dialogue_balloon(\
		"start", \
		dialogue_balloon)
		start = 2
		scene_vars.title_scene = false	
		scene_vars.driving_scene = true	
		$TitleMusic.stop()
		$Music.play()
		change_scene()
		print("Start Value: "+str(start))
		


#	if start == 1:
#		var dialogue_balloon = load("res://assets/dialogue/tutorial.tres")
#		DialogueManager.show_example_dialogue_balloon(\
#		"testing_node", \
#		dialogue_balloon)
#		start = 2
#		scene_vars.driving_scene = true	
#		change_scene()

	if scene_vars.score < 0:
		$EndScene.visible = true
		change_scene()

#Debug Keys
#	if Input.is_action_just_pressed("ui_debug"):
#		debug = not debug
#		print("Debug value: "+str(debug))
#
#	if Input.is_action_just_pressed("ui_scenedebug"):
#		scenedebug = not scenedebug
#		print("Scene Debug "+str(scenedebug))


	if Input.is_action_just_pressed("ui_one"):
		if debug == 1 and scenedebug == 0:
	#		print("One pressed")
			$TitleScene.visible = not $TitleScene.visible
			scene_vars.title_scene = not scene_vars.title_scene
		if debug == 0 and scenedebug == 1:
			var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
			DialogueManager.show_example_dialogue_balloon(\
			"Firstchoice_Mike", \
			dialogue_balloon)
			start = 2
			scene_vars.character_selected = scene_vars.mike
			scene_vars.talking_scene = true	
			scene_vars.driving_scene = true	
			scene_vars.HUD = true
			change_scene()


	if Input.is_action_just_pressed("ui_two"):
		if debug == 1 and scenedebug == 0:
			$TitleScene.visible = not $TitleScene.visible
			scene_vars.title_scene = not scene_vars.title_scene
		if debug == 0 and scenedebug == 1:
			var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
			DialogueManager.show_example_dialogue_balloon(\
			"Altright_Mike", \
			dialogue_balloon)
			start = 2
			scene_vars.character_selected = scene_vars.mike
			scene_vars.talking_scene = true	
			scene_vars.driving_scene = true	
			scene_vars.HUD = true
			change_scene()

	if Input.is_action_just_pressed("ui_three"):
		if debug == 1 and scenedebug == 0:
			$TalkingScene.visible = not $TalkingScene.visible
			scene_vars.talking_scene = not scene_vars.talking_scene
		if debug == 0 and scenedebug == 1:
			var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
			DialogueManager.show_example_dialogue_balloon(\
			"Familyman_Mike", \
			dialogue_balloon)
			start = 2
			scene_vars.character_selected = scene_vars.mike
			scene_vars.talking_scene = true	
			scene_vars.driving_scene = true	
			scene_vars.HUD = true
			change_scene()

	
	if Input.is_action_just_pressed("ui_four"):
		if debug == 1 and scenedebug == 0:
			$DossierScene.visible = not $DossierScene.visible
			scene_vars.dossier_scene = not scene_vars.dossier_scene
		if debug == 0 and scenedebug == 1:
			var dialogue_balloon = load("res://assets/dialogue/dialogue_one_revised.tres")
			DialogueManager.show_example_dialogue_balloon(\
			"Community_Mike", \
			dialogue_balloon)
			start = 2
			scene_vars.character_selected = scene_vars.mike
			scene_vars.talking_scene = true	
			scene_vars.driving_scene = true	
			scene_vars.HUD = true
			change_scene()
	
	if Input.is_action_just_pressed("ui_five") and debug == 1:
#		print("Five pressed")
		$HUD.visible = not $HUD.visible
		scene_vars.HUD = not scene_vars.HUD
	
	if Input.is_action_just_pressed("ui_six") and debug == 1:
#		print("Six pressed")
		$EndScene.visible = not $EndScene.visible
		scene_vars.end_scene = not scene_vars.end_scene

	if Input.is_action_just_pressed("ui_restart") and debug == 1:
		print("restart")
		_ready()
		change_scene()

	
#	if scene_vars.title_scene == true:
##		print("Title Scene Enabled")
#		$TitleScene.visible = true
#	if scene_vars.driving_scene == true:
##		print("Driving Scene Enabled")
#		$DrivingScene.visible = true
#	if scene_vars.dossier_scene == true:
##		print("Dossier Scene Enabled")
#		$DossierScene.visible = true
#	if scene_vars.HUD == true:
##		print("HUD Enabled")
#		$HUD.visible = true
#	if scene_vars.end_scene == true:
##		print("End Scene Enabled")
#		$EndScene.visible = true
#
#	if scene_vars.character == 2:
#		$DossierScene/LeftSprite.animation="char_2"
	
	
		
#	pass

#func _on_hitbox_entered(area: Area2D) -> void:
#	print("res://assets/levels_"+string(int(get_true(.current_scene.name) + 1) + ".tscn"))
	#get_tree().change_scene("res://assets/levels_"+string(int(get_true(.current_scene.name) + 1) + ".tscn")
	
