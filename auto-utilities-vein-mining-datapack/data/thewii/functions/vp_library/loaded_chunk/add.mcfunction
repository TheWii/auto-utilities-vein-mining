scoreboard objectives add vp_temp dummy
scoreboard players set #dependencies vp_temp 0
execute store result score #dependencies vp_temp run data get storage thewii:vp_library/data ChunkDependents

execute if score #dependencies vp_temp matches ..0 run function thewii:vp_library/loaded_chunk/load

execute if score #dependencies vp_temp matches ..-1 run scoreboard players set #dependencies vp_temp 0
execute store result storage thewii:vp_library/data ChunkDependents int 1 run scoreboard players add #dependencies vp_temp 1