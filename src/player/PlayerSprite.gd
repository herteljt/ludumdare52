extends Sprite

var angular_speed = PI
var speed = 400.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	
	
#func _process(delta):
#	var direction = 0
#	if Input.is_action_pressed("ui_left"):
#		direction = -1
#	if Input.is_action_pressed("ui_right"):
#		direction = 1
#
#	rotation += angular_speed*direction*delta
var velocity = Vector2.ZERO
	
#func _process(delta):
#	var direction = Vector2.ZERO
#	if Input.is_action_pressed("ui_right"):
#		print("right pressed")
#		direction.x += 1
#		velocity = Vector2.RIGHT.rotated(rotation)*speed
#		position += velocity*delta
#	if Input.is_action_pressed("ui_left"):
#		direction.x -= 1
#		print("left pressed")
#		velocity = Vector2.LEFT.rotated(rotation)*speed
#		position += velocity*delta
#	if Input.is_action_pressed("ui_down"):
#		direction.y += 1
#		print("down pressed")
#		velocity = Vector2.DOWN.rotated(rotation)*speed
#		position += velocity*delta
#	if Input.is_action_pressed("ui_up"):
#		direction.y -= 1
#		print("up pressed")	
#		velocity = Vector2.UP.rotated(rotation)*speed
#		position += velocity*delta
#
func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		velocity = Vector2.RIGHT.rotated(rotation)*speed
		position += velocity*delta
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		velocity = Vector2.LEFT.rotated(rotation)*speed
		position += velocity*delta
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		velocity = Vector2.DOWN.rotated(rotation)*speed
		position += velocity*delta
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		velocity = Vector2.UP.rotated(rotation)*speed
		position += velocity*delta		
#	if direction.length() > 0:
#		direction = direction.normalized()
#		$AnimatedSprite.play()
#	else:
#		$AnimatedSprite.stop()
#
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
#	var velocity = Vector2.ZERO
#	if Input.is_action_pressed("ui_up"):
#		velocity = Vector2.UP.rotated(rotation)*speed
#		position += velocity*delta
