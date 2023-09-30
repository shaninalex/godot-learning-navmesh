extends CharacterBody2D


@onready var agent = $NavigationAgent2D
@onready var sprite = $Sprite2D

var ROTATION_SPEED = 10
var SPEED = 100
var targ: Vector2

func _process(delta):
	if position.distance_to(targ) > 10:
		var curLoc = global_transform.origin
		var nextLoc = agent.get_next_path_position()
		var newVel = (nextLoc - curLoc).normalized() * SPEED
		velocity = newVel
		self.rotation = lerp_angle(self.rotation, curLoc.angle_to_point(nextLoc), delta * ROTATION_SPEED);
		move_and_slide()

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		targ = event.position
		update_target_position(targ)


func update_target_position(target):
	agent.set_target_position(target)





