# Particles and sound
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:wooden_pickaxe"} anchored eyes run particle item minecraft:wooden_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:stone_pickaxe"} anchored eyes run particle item minecraft:stone_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:golden_pickaxe"} anchored eyes run particle item minecraft:golden_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:iron_pickaxe"} anchored eyes run particle item minecraft:iron_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:diamond_pickaxe"} anchored eyes run particle item minecraft:diamond_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute if data storage thewii:autominer/temp SelectedItem{id:"minecraft:netherite_pickaxe"} anchored eyes run particle item minecraft:netherite_pickaxe ^ ^-0.3 ^0.5 0.1 0.1 0.1 0.075 8 normal @s[tag=!global.ignore.gui]
execute at @s[tag=!global.ignore.gui] run playsound minecraft:item.shield.break player @s ~ ~ ~ 1 1

data remove storage thewii:autominer/temp SelectedItem