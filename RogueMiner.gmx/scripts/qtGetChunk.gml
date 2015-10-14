//qtGetChunk qt, loc_x, loc_y, create_if_missing
var qt = argument0;
var loc_x = argument1;
var loc_y = argument2;
var create_if_missing = argument3;

var cx = qt[? "center_x"];
var cy = qt[? "center_y"];

var dx = loc_x - cx;
var dy = loc_y - cy;

var chunk_size = qt[? "chunk_size"];
var dcx = dx / chunk_size;
var dcy = dy / chunk_size;

var qt_radius = 2 ^ qt[? "log2_radius"];
if(abs(dcx) > qt_radius || abs(dcy) > qt_radius ){
  if(!create_if_missing){
    return undefined;
  }
  var old_top = ds_map_create();
  ds_map_copy(old_top, qt);
  
  var new_center_x = 0;
  var x_idx = 0;
  var new_center_y = 0;
  var y_idx = 0;
  
  if(loc_x > cx){
    new_center_x = cx + qt_radius;
    new_child_center_x = cx + qt_radius*2;
    x_idx = 0;
  }else{
    new_center_x = cx - qt_radius;
    new_child_center_x = cx - qt_radius*2;
    x_idx = 1;
  }
  
  if(loc_y > cy){
    new_center_y = cy + qt_radius; 
    new_child_center_y = cy + qt_radius*2;
    y_idx = 0;
  }else{
    new_center_y = cy - qt_radius;
    new_child_center_y = cy - qt_radius*2;
    y_idx = 1;
  }
    
  var new_top = qtCreate(chunk_size, new_center_x, new_center_y, qt[? "log2_radius"]+1, false, false);
  
  ds_map_copy(qt, new_top);
  var children = qt[?"children"];
  children[# x_idx, y_idx ] = old_top;
  
  
}
