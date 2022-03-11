import ../objectives as obj

#TODO Plugin to handle score holders?
scoreboard players reset $custom_dur obj.temp
scoreboard players reset $keep_broken obj.temp
scoreboard players reset $xp obj.temp
scoreboard players reset $current_damage obj.temp
scoreboard players reset $damage obj.temp
scoreboard players reset $damaged obj.temp
scoreboard players reset $unbreaking obj.temp
scoreboard players reset $unbreakable obj.temp
scoreboard players reset $silktouch obj.temp
scoreboard players reset $durability obj.temp
scoreboard players reset $level obj.temp
scoreboard players reset $length obj.temp

# Defaults to 0
unless score @s obj.sneak matches 0..2 run scoreboard players set @s obj.sneak 0

# Different condition handling depending on the sneak setting
# Unless the deactivated setting is enabled
unless score @s obj.deactivated matches 1.. expand:
    if score @s obj.sneak matches 0 unless predicate ../is_sneaking run function ./find
    if score @s obj.sneak matches 1 if predicate ../is_sneaking run function ./find
    if score @s obj.sneak matches 2 run function ./find

# Reset scores
for name in obj.ores.values():
    scoreboard players reset @s name