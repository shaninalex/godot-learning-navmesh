extends CharacterBody2D


@onready var agent = $NavigationAgent2D
@onready var sprite = $Sprite2D
@onready var target: Vector2

var ROTATION_SPEED = 10
var SPEED = 100

func _process(delta):
	if position.distance_to(target) > 0.2:
		var curLoc = global_transform.origin
		var nextLoc = agent.get_next_path_position()
		var newVel = (nextLoc - curLoc).normalized() * SPEED
		velocity = newVel
		self.rotation = lerp_angle(self.rotation, curLoc.angle_to_point(nextLoc), delta * ROTATION_SPEED);
		move_and_slide()

func _input(event):
   # Mouse in viewport coordinates.
	print(target)
	if target:
		update_target_position(target)

func update_target_position(__target):
	agent.set_target_position(__target)
