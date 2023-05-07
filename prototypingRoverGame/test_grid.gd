extends TileMap

enum { EMPTY = -1, PLAYER, OBJECT, WALL}
@onready var entities = get_parent().get_node("Entities").get_children()

func _ready():
	for child in entities:
		set_cell(0, local_to_map(child.position), child.type)
		
func get_cell_entity(coordinates):
	for node in entities:
		if local_to_map(node.position) == coordinates:
			return(node)

func request_move(entity, direction):
	var cell_start = local_to_map(entity.position)
	var cell_target = cell_start + direction
	
	var cell_target_type = get_cell_source_id(0, cell_target)
	
	print(cell_start)
	
	match cell_target_type:
		EMPTY:
			return update_entity_position(entity, cell_start, cell_target)
		OBJECT:
			var object_entity = get_cell_entity(cell_target)
			object_entity.queue_free()
			return update_entity_position(entity, cell_start, cell_target)
		PLAYER:
			var entity_name = get_cell_entity(cell_target).name
			print("Cell %s contains %s" % [cell_target, entity_name])

func update_entity_position(entity, cell_start, cell_target):
	set_cell(cell_target, entity.type)
	set_cell(0, cell_start, EMPTY)
	return map_to_local(cell_target) + Vector2(1, 1) * (cell_quadrant_size / 2)
