# Store mainhand
data modify storage thewii:autominer/temp SelectedItem set from entity @s SelectedItem

scoreboard players set $length twvm.tool 0

# Get tool info
function thewii:autominer/damage/get

# Call loop
execute unless score $custom_dur twvm.tool matches 1 if score $level twvm.tool matches 1 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/loop_level/wooden
execute unless score $custom_dur twvm.tool matches 1 if score $level twvm.tool matches 2 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/loop_level/stone
execute unless score $custom_dur twvm.tool matches 1 if score $level twvm.tool matches 3 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/loop_level/iron
execute unless score $custom_dur twvm.tool matches 1 if score $level twvm.tool matches 4.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/loop_level/diamond

# Summon xp
execute if score $xp twvm.tool matches 1.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/xp/summon

# Replace tool
execute unless score $unbreakable twvm.tool matches 1 if score $damage twvm.tool matches 1.. run function thewii:autominer/damage/replace

# Untag item
tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] remove twvm.ore

# Clear storage
data remove storage thewii:autominer/temp SelectedItem