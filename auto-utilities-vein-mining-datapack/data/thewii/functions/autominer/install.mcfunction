# Check required version
scoreboard objectives add twvm.tool dummy
scoreboard players set $1.15 twvm.tool 0
function thewii:autominer/detect_1.15

# Validation (Check requirements)
scoreboard players set #valid_load twvm.tool 1

execute unless score $1.15 twvm.tool matches 1 run scoreboard players set #valid_load twvm.tool 0
execute unless score #thewii.vplib.loaded_chunk load matches 500.. run scoreboard players set #valid_load twvm.tool 0

# Success
execute if score #valid_load twvm.tool matches 1 run function thewii:autominer/install_2

# Failed
execute if score #valid_load twvm.tool matches 0 unless score $1.15 twvm.tool matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining failed to be loaded. It needs at least minecraft 1.15.","color":"white","bold":false}]
execute if score #valid_load twvm.tool matches 0 if score $1.15 twvm.tool matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining failed to be loaded. Vanilla+ Library modules are missing.","color":"white","bold":false}]
execute if score #valid_load twvm.tool matches 0 run scoreboard players set $installed twvm.tool 0