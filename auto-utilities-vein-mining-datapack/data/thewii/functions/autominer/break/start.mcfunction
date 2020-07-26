# Store mainhand
data modify storage thewii:autominer/temp SelectedItem set from entity @s SelectedItem

scoreboard players set $length twvm.tool 0

# Get tool info
function thewii:autominer/damage/get

# Method
execute unless score @s twvm.method matches 0..1 run scoreboard players set @s twvm.method 0
execute if score @s twvm.method matches 0 run function thewii:autominer/break/method_ore
execute if score @s twvm.method matches 1 run function thewii:autominer/break/method_level

# Call loop
execute unless score $custom_dur twvm.tool matches 1 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/recursion/recurse

# Summon xp
execute if score $xp twvm.tool matches 1.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function thewii:autominer/xp/summon

# Replace tool
execute unless score $unbreakable twvm.tool matches 1 if score $damage twvm.tool matches 1.. run function thewii:autominer/damage/replace

# Untag item
tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] remove twvm.ore

# Clear storage
data remove storage thewii:autominer/temp SelectedItem