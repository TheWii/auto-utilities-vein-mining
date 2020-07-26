data modify storage thewii:autominer/temp SelectedItem set from entity @s SelectedItem

execute store result score @s twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Damage

execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:wooden_pickaxe"} run scoreboard players set $limit twvm.tool 59
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:stone_pickaxe"} run scoreboard players set $limit twvm.tool 131
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:golden_pickaxe"} run scoreboard players set $limit twvm.tool 32
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:iron_pickaxe"} run scoreboard players set $limit twvm.tool 250
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:diamond_pickaxe"} run scoreboard players set $limit twvm.tool 1561
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:netherite_pickaxe"} run scoreboard players set $limit twvm.tool 2031

execute unless data storage thewii:autominer/temp SelectedItem{tag:{Enchantments:[{id:"minecraft:unbreaking"}]}} run scoreboard players set $unbreaking twvm.tool 0
execute store result score $unbreaking twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

execute store result score $unbreakable twvm.tool run data get storage thewii:autominer/temp SelectedItem.tag.Unbreakable
execute unless score $unbreakable twvm.tool matches 0 run scoreboard players set $unbreakable twvm.tool 1

execute if data storage thewii:autominer/temp SelectedItem{tag:{Enchantments:[{id:"minecraft:silk_touch"}]}} run scoreboard players set $silktouch twvm.tool 1

data remove storage thewii:autominer/temp SelectedItem