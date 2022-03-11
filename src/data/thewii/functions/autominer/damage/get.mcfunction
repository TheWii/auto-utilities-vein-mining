import ../objectives as obj

# Detect custom durability
execute store success score $custom_dur obj.temp
    if data storage ../temp SelectedItem.tag.ctc.tool.durability

# Get damage
unless score $custom_dur obj.temp matches 1
    store result score $current_damage obj.temp
    run data get storage ../temp SelectedItem.tag.Damage 
if score $custom_dur obj.temp matches 1
    store result score $current_damage obj.temp
    run data get storage ../temp SelectedItem.tag.ctc.tool.damage 

# Get durability
for tool_id in ctx.meta.tools.keys():
    tool = ctx.meta.tools[tool_id]
    if data storage ../temp SelectedItem{id:tool_id}:
        scoreboard players set $durability obj.temp tool.durability
#!endfor
if score $custom_dur obj.temp matches 1
    store result score $durability obj.temp
    run data get storage ../temp SelectedItem.tag.ctc.tool.durability

# Stop vein mining before tool breaks
unless score @s obj.safeBreak matches 1:
    scoreboard players remove $durability obj.temp 1

# Get unbreaking level (0 if not enchanted)
unless data storage ../temp SelectedItem{tag:{Enchantments:[{id:"minecraft:unbreaking"}]}}:
    scoreboard players set $unbreaking obj.temp 0
store result score $unbreaking obj.temp:
    data get storage ../temp SelectedItem.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

# Get unbreakable (tag exists with a non-zero value)
store result score $unbreakable obj.temp:
    data get storage ../temp SelectedItem.tag.Unbreakable
unless score $unbreakable obj.temp matches 0:
    scoreboard players set $unbreakable obj.temp 1

# Get silk touch
if data storage ../temp SelectedItem{tag:{Enchantments:[{id:"minecraft:silk_touch"}]}}
    scoreboard players set $silktouch obj.temp 1