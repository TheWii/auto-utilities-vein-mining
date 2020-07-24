summon minecraft:area_effect_cloud 29999999 0 4320 {Duration:1,Tags:["vp_uuid"]}

execute if score $1.16 vp_data matches 0 store result score #lcg vp_math run data get entity @e[type=area_effect_cloud,tag=vp_uuid,limit=1] UUIDMost 0.0000000001
execute if score $1.16 vp_data matches 1 store result score #lcg vp_math run data get entity @e[type=area_effect_cloud,tag=vp_uuid,limit=1] UUID[0]

kill @e[type=area_effect_cloud,tag=vp_uuid,limit=1]

execute if score #lcg vp_math matches ..-1 run scoreboard players operation #lcg vp_math *= #-1 vp_math