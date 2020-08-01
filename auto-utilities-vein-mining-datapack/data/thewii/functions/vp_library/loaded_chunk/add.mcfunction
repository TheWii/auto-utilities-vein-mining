scoreboard players set #dependencies twvp.temp 0
execute store result score #dependencies twvp.temp run data get storage thewii:vp_library/data modules.loaded_chunk

execute if score #dependencies twvp.temp matches ..0 run function thewii:vp_library/loaded_chunk/install

execute if score #dependencies twvp.temp matches ..-1 run scoreboard players set #dependencies twvp.temp 0
execute store result storage thewii:vp_library/data modules.loaded_chunk int 1 run scoreboard players add #dependencies twvp.temp 1