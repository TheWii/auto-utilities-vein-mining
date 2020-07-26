# Detect custom durability and get breaking method
execute if data storage thewii:autominer/temp SelectedItem.tag.ctc.tool.durability run scoreboard players set $custom_dur twvm.tool 1
execute if score $custom_dur twvm.tool matches 1 store success score $keep_broken twvm.tool if data storage thewii:autominer/temp SelectedItem.tag.ctc.tool.broken

# Get damage
execute unless score $custom_dur twvm.tool matches 1 store result score $current_damage twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Damage
execute if score $custom_dur twvm.tool matches 1 store result score $current_damage twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.ctc.tool.damage 

# Get mining level
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:wooden_pickaxe"} run scoreboard players set $level twvm.tool 1
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:stone_pickaxe"} run scoreboard players set $level twvm.tool 2
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:golden_pickaxe"} run scoreboard players set $level twvm.tool 2
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:iron_pickaxe"} run scoreboard players set $level twvm.tool 3
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:diamond_pickaxe"} run scoreboard players set $level twvm.tool 4
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:netherite_pickaxe"} run scoreboard players set $level twvm.tool 5

# Get durability
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:wooden_pickaxe"} run scoreboard players set $durability twvm.tool 59
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:stone_pickaxe"} run scoreboard players set $durability twvm.tool 131
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:golden_pickaxe"} run scoreboard players set $durability twvm.tool 32
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:iron_pickaxe"} run scoreboard players set $durability twvm.tool 250
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:diamond_pickaxe"} run scoreboard players set $durability twvm.tool 1561
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:netherite_pickaxe"} run scoreboard players set $durability twvm.tool 2031
scoreboard players remove $durability twvm.tool 1

execute if score $custom_dur twvm.tool matches 1 store result score $durability twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.ctc.tool.durability 

# Get unbreaking/unbreakable
execute unless data storage thewii:autominer/temp SelectedItem{tag:{Enchantments:[{id:"minecraft:unbreaking"}]}} run scoreboard players set $unbreaking twvm.tool 0
execute store result score $unbreaking twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

execute store result score $unbreakable twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Unbreakable
execute unless score $unbreakable twvm.tool matches 0 run scoreboard players set $unbreakable twvm.tool 1

# Get silk touch
execute if data storage thewii:autominer/temp SelectedItem{tag:{Enchantments:[{id:"minecraft:silk_touch"}]}} run scoreboard players set $silktouch twvm.tool 1