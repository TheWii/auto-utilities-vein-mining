#> thewii:autominer/load

# Reset
scoreboard players set $installed twvm.tool 0

# Check required version
scoreboard objectives add twvm.tool dummy
scoreboard players set $1.15 twvm.tool 0
function thewii:autominer/detect_1.15

# Success
execute if score $1.15 twvm.tool matches 1 run function thewii:autominer/load_2

# Failed
execute if score $1.15 twvm.tool matches 0 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining failed to be loaded. Minecraft 1.15 or higher is required.","color":"white","bold":false}]
execute if score $1.15 twvm.tool matches 0 run scoreboard players set $installed twvm.tool 0