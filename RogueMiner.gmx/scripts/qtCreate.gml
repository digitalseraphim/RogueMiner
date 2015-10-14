// chunk_size center_x center_y log2_init_radius create_chunks recursive

/*
log2_init_radius = 0
1 1
 C
1 1

log2_init_radius = 1
11 22
11 22
  C
33 44
33 44

log2_init_radius = 2
1122 5566
1122 5566
3344 7788
3344 7788
    C
99aa ddee
99aa ddee
bbcc ffgg
bbcc ffgg

*/

var chunk_size = argument0;
var center_x = argument1;
var center_y = argument2;
var log2_init_radius = argument3;
var create_chunks = argument4;
var recursive = argument5;

top = ds_map_create();

top[? "chunk_size"] = chunk_size;
top[? "center_x"] = center_x;
top[? "center_y"] = center_y;
top[? "log2_radius"] = log2_init_radius;

top[? "leaf_node"] = (log2_init_radius==0);

var children = ds_grid_create(2,2);
top[? "children"] = children;

if(top[? "leaf_node"]){
  if(create_chunks){
    children[# 0, 0] = ds_grid_create(chunk_size, chunk_size);
    children[# 0, 1] = ds_grid_create(chunk_size, chunk_size);
    children[# 1, 0] = ds_grid_create(chunk_size, chunk_size);
    children[# 1, 1] = ds_grid_create(chunk_size, chunk_size);
  }
}else{
  if(recursive){
    var dc = 2^(log2_init_radius-1);
    children[# 0, 0] = qtCreate(chunk_size, center_x-dc, center_y-dc, log2_init_radius - 1, create_chunks);
    children[# 0, 1] = qtCreate(chunk_size, center_x+dc, center_y-dc, log2_init_radius - 1, create_chunks);
    children[# 1, 0] = qtCreate(chunk_size, center_x-dc, center_y+dc, log2_init_radius - 1, create_chunks);
    children[# 1, 1] = qtCreate(chunk_size, center_x+dc, center_y+dc, log2_init_radius - 1, create_chunks);
  }
}

return top;
