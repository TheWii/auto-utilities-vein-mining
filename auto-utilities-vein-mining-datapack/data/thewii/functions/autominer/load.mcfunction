#> thewii:autominer/load

# Reset
scoreboard players set $installed twvm.tool 0

# Check required version
scoreboard objectives add twvm.tool dummy
scoreboard players set $1.16 twvm.tool 0
function thewii:autominer/detect_1.16

# Success
execute if score $1.16 twvm.tool matches 1 run function thewii:autominer/load_2

# Failed
execute if score $1.16 twvm.tool matches 0 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining failed to be loaded. Either upgrade to Minecraft 1.16.2+ or use an older version of this data pack.","color":"white","bold":false}]
execute if score $1.16 twvm.tool matches 0 run scoreboard players set $installed twvm.tool 0