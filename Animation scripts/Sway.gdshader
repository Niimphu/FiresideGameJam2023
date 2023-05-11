shader_type canvas_item;

void vertex(){
	VERTEX.x += sin(TIME) * 40.0 * (UV.y - 1.0);
}
