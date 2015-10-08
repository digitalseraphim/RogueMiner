//qtGetChunk qt, loc_x, loc_y, create_if_missing
var qt = argument0;
var loc_x = argument1;
var loc_y = argument2;
var create_if_missing = argument3;

var dx = qt[? "center_x"] - loc_x;
var dy = qt[? "center_y"] - loc_y;

var chunk_size = qt[? "chunk_size"];
var dcx = dx / chunk_size;
var dcy = dy / chunk_size;

var qt_radius = 2 ^ qt[? "log2_radius"];
if(abs(dcx) > qt_radius || abs(dcy) > qt_radius ){
  if(!create_if_missing){
    return undefined;
  }
}