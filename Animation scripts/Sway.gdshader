shader_type canvas_item;

void vertex(){
	VERTEX.x += sin(TIME * 1.2) * 50.0 * (UV.y - 1.0);
}
