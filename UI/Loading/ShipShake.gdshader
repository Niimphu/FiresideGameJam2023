shader_type canvas_item;

uniform float movement_speed_multiplier_y = 50.0;
uniform float movement_speed_multiplier_x = 200.0;
uniform float movement_distance_multiplier = 2.0;
uniform float movement_y_position_offset = 0.0;
uniform float movement_x_position_offset = 5.0;

void vertex()
{
	VERTEX.y += sin((TIME + movement_y_position_offset) * movement_speed_multiplier_y) * movement_distance_multiplier;
	VERTEX.x += sin((TIME + movement_x_position_offset) * movement_speed_multiplier_x) * movement_distance_multiplier;
}