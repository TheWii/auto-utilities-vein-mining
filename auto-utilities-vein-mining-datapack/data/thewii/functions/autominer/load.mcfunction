#> thewii:autominer/load

# Reset
scoreboard players set $installed twvm.tool 0

# Check required version
scoreboard objectives add twvm.tool dummy
scoreboard players set $1.18 twvm.tool 0
function thewii:autominer/detect_1.18

# Success
execute if score $1.18 twvm.tool matches 1 run function thewii:autominer/load_2

# Failed
execute if score $1.18 twvm.tool matches 0 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining v4.0 failed to be loaded. Either upgrade to Minecraft 1.18+ or use an older version of this data pack. ","color":"white","bold":false},{"text":"(Download for 1.16.2-1.17)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v3.0"}},{"text":" "},{"text":"(Download for 1.16.1 or older)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v2.0"}}]
execute if score $1.18 twvm.tool matches 0 run scoreboard players set $installed twvm.tool 0