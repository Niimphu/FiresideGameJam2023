shader_type canvas_item;

void vertex(){
	VERTEX.x += sin(TIME) * 60.0 * (UV.y - 1.0);
}
