extends Node2D

onready var scene_vars = get_node("/root/GameState")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var debug: bool = false
var start: int

func new_game():
	scene_vars.title_scene = true
	scene_vars.driving_scene = false
	scene_vars.talking_scene = false
	scene_vars.dossier_scene = false
	scene_vars.HUD = false
	scene_vars.end_scene = false
	
	$HUD.update_score(scene_vars.score)
#
#	get_tree().call_group("mobs", "queue_free")
#	$Player.start($StartPosition.position)
#	$StartTimer.start()
#
#	$HUD.show_message("Get ready...")
#
#	yield($StartTimer,"timeout")
#	$ScoreTimer.start()
#	$MobTimer.start()
#	$Music.play()
#
#func game_over():
#	$ScoreTimer.stop()
#	$MobTimer.stop()
#	$HUD.show_game_over()
#	$Music.stop()
#	$DeathSound.play()


# Called when the node enters the scene tree for the first time.
func _ready():
	scene_vars.score = 0
#	scene_vars.score_change_amount = 0
#	scene_vars.score_change = false
	
	scene_vars.title_scene = true
	scene_vars.driving_scene = false
	scene_vars.talking_scene = false
	scene_vars.dossier_scene = false
	scene_vars.HUD = false
	scene_vars.end_scene = false
	
	#var resource = preload("res://assets/dialogue/tutorial.tres")

#	DialogueManager.show_example_dialogue_balloon(\
#	"testing_node", \
#	resource
	#)
	start = 1

	

func update_score(score_change): 
	print("Old score"+ str(scene_vars.score))
	print("Score Change Amount"+ str(score_change))
	scene_vars.score = scene_vars.score + score_change
	print("New score"+ str(scene_vars.score))
	print("UpdateScore") 
	$HUD.update_score(scene_vars.score)

func change_scene():
	if scene_vars.title_scene == true:
#		print("Title Scene Enabled")
		$TitleScene.visible = true
	if scene_vars.driving_scene == true:
#		print("Driving Scene Enabled")
		$DrivingScene.visible = true
	if scene_vars.talking_scene == true:
#		print("Talking Scene Enabled")
		$DrivingScene.visible = true
		$TalkingScene.visible = true
		$HUD.visible = true
		$DossierScene.visible = false
		if scene_vars.character == 1:
			$TalkingScene/CharacterSprite.animation="char_1"
		if scene_vars.character == 2:
			$TalkingScene/CharacterSprite.animation="char_2"
		if scene_vars.character == 3:
			$TalkingScene/CharacterSprite.animation="char_3"
		if scene_vars.character == 4:
			$TalkingScene/CharacterSprite.animation="char_4"
	if scene_vars.dossier_scene == true:
#		print("Dossier Scene Enabled")
		$DossierScene.visible = true
	if scene_vars.HUD == true:
#		print("HUD Enabled")
		$HUD.visible = true
	if scene_vars.end_scene == true:
#		print("End Scene Enabled")
		$EndScene.visible = true



	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_start"):
		start = 1
		print("Start Value: "+str(start))

	if start == 1:
		var dialogue_balloon = load("res://assets/dialogue/tutorial.tres")
		DialogueManager.show_example_dialogue_balloon(\
		"testing_node", \
		dialogue_balloon)
		start = 0
		scene_vars.dossier_scene = true	
		change_scene()

	if scene_vars.score < 0:
		$EndScene.visible = true
		change_scene()

	if Input.is_action_just_pressed("ui_debug"):
		debug = not debug
		print("Debug value: "+str(debug))
		
	if Input.is_action_just_pressed("ui_one") and debug == true:
#		print("One pressed")
		$TitleScene.visible = not $TitleScene.visible
		scene_vars.title_scene = not scene_vars.title_scene

	if Input.is_action_just_pressed("ui_two") and debug == true:
#		print("Two pressed")
		$DrivingScene.visible = not $DrivingScene.visible
		scene_vars.driving_scene = not scene_vars.driving_scene

	if Input.is_action_just_pressed("ui_three") and debug == true:
#		print("Three pressed")
		$TalkingScene.visible = not $TalkingScene.visible
		scene_vars.talking_scene = not scene_vars.talking_scene
	
	if Input.is_action_just_pressed("ui_four") and debug == true:
#		print("Four pressed")
		$DossierScene.visible = not $DossierScene.visible
		scene_vars.dossier_scene = not scene_vars.dossier_scene
	
	if Input.is_action_just_pressed("ui_five") and debug == true:
#		print("Five pressed")
		$HUD.visible = not $HUD.visible
		scene_vars.HUD = not scene_vars.HUD
	
	if Input.is_action_just_pressed("ui_six") and debug == true:
#		print("Six pressed")
		$EndScene.visible = not $EndScene.visible
		scene_vars.end_scene = not scene_vars.end_scene

	if Input.is_action_just_pressed("ui_restart") and debug == true:
#		print("Six pressed")
		_ready()

	
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
	
