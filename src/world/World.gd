extends Node2D

onready var scene_vars = get_node("/root/GameState")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func new_game():
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
	scene_vars.score_change_amount = 0
	scene_vars.score_change = false
	
	var resource = preload("res://assets/dialogue/dialogue_mike.tres")

	DialogueManager.show_example_dialogue_balloon(\
	"start", \
	resource
	)
	
	

func update_score(score_change): 
	print("Old score"+ str(scene_vars.score))
	print("Score Change Amount"+ str(score_change))
	scene_vars.score = scene_vars.score + score_change
	print("New score"+ str(scene_vars.score))
	print("UpdateScore") 
	$HUD.update_score(scene_vars.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("ui_one"):
		print("One pressed")
	
	if scene_vars.title_scene == true:
		print("Title Scene")
		$TitleScene.visible = true
		$DrivingScene.visible = false
		$DossierScene.visible = false
		$EndScene.visible = false
	if scene_vars.driving_scene == true:
		#print("Driving Scene")
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
	
