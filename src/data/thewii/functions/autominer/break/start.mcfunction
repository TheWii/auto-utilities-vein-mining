import ../objectives as obj
oreTag = ctx.meta.prefix + '.ore'
selfTag = ctx.meta.prefix + '.self'

# Tag executer
tag @s add selfTag

# Store mainhand and get tool info
data modify storage ../temp SelectedItem set from entity @s SelectedItem
function ../damage/get

# Get level by selected method
unless score @s obj.method matches 0..1 run scoreboard players set @s obj.method 0
if score @s obj.method matches 0 run function ./method/ore
if score @s obj.method matches 1 run function ./method/level

# Prepare recursion
scoreboard players operation $damaged obj.temp = $current_damage obj.temp
scoreboard players operation $damaged obj.temp += $damage obj.temp
scoreboard players set $length obj.temp 0

# Start recursion at dropped item
unless score $custom_dur obj.temp matches 1
    unless score $damaged obj.temp >= $durability obj.temp
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag=oreTag]
    run function ../recursion/recurse

# Summon xp at the block position
if score $xp obj.temp matches 1..
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag=oreTag]
    run function ../xp/summon

# Damage tool
if score $damage obj.temp matches 1..
    unless score $unbreakable obj.temp matches 1
    run function ../damage/replace

# Teleport xp/item of ore that triggered the vein mining.
if score @s obj.dropItems matches 1 expand:
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag=oreTag]
        run tp @e[type=experience_orb,distance=..0.5] @s
    as @e[type=item,limit=1,sort=nearest,distance=..8,tag=oreTag]
        at @s run function ../recursion/teleport

# Untag item
tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=oreTag] remove oreTag

# Clear storage
data remove storage ../temp SelectedItem

# Remove selector tag
tag @s remove selfTag