extends Node2D

onready var scene_vars = get_node("/root/GameState")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#func new_game():
#	score = 0
#	$HUD.update_score(score)
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
	var resource = preload("res://assets/dialogue/tutorial.tres")
	DialogueManager.show_example_dialogue_balloon(\
	"tutorial_start_node", \
	resource
	)
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_one"):
		print("One pressed")
		scene_vars.title_scene == true
	
	if scene_vars.title_scene == true:
		print("Title Scene")
		$TitleScene.visible = true
		$DrivingScene.visible = false
		$DossierScene.visible = false
		$EndScene.visible = false
	if scene_vars.driving_scene == true:
		print("Driving Scene")
		$TitleScene.visible = false
		$DrivingScene.visible = true
		$DossierScene.visible = false
		$EndScene.visible = false
	if scene_vars.dossier_scene == true:
		print("Dossier Scene")
		$TitleScene.visible = false
		$DrivingScene.visible = true
		$DossierScene.visible = true
		$EndScene.visible = false
	if scene_vars.end_scene == true:
		print("End Scene")
		$TitleScene.visible = false
		$DrivingScene.visible = false
		$DossierScene.visible = false
		$EndScene.visible = true
		
	if scene_vars.character == 2:
		$DossierScene/LeftSprite.animation="char_2"
	
	
		
#	pass

#func _on_hitbox_entered(area: Area2D) -> void:
#	print("res://assets/levels_"+string(int(get_true(.current_scene.name) + 1) + ".tscn"))
	#get_tree().change_scene("res://assets/levels_"+string(int(get_true(.current_scene.name) + 1) + ".tscn")
	
