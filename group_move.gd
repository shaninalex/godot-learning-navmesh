extends Node

@onready var units_group = []
var target_position: Vector2
var format_spacing = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton:
		target_position = event.position
		units_group = get_children()
		
		# calculate square with offset between units
		var num_units = units_group.size()
		print(num_units)
		var num_rows = ceil(sqrt(num_units))
		var num_columns = ceil(num_units / num_rows)
		var square_width = num_columns * 50 # units_group[0].width()
		var square_height = num_rows * 50 # units_group[0].height()
		var horizontal_spacing = square_width / num_columns
		var vertical_spacing = square_height / num_rows

		for row in range(num_rows):
			for col in range(num_columns):
				var unit_index = row * num_columns + col
				if unit_index <= num_units + 1:
					var unit = units_group[unit_index]  # Get the unit at the current index
					# add unit position to target_position (event click)
					var _target = target_position + Vector2(col * horizontal_spacing, row * vertical_spacing)
					unit.target = _target
					#unit.position.y = 
				else:
					break
		
		#for unit in units_group:
		#	unit.target = event.position
		#print("Mouse Click/Unclick at: ", event.position)
