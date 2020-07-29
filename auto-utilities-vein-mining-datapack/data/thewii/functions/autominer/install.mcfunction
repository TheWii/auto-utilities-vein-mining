scoreboard objectives add twvm.tool dummy
scoreboard players set $1.15 twvm.tool 0 
function thewii:autominer/detect_1.15

execute if score $1.15 twvm.tool matches 0 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining failed to install. It needs at least minecraft 1.15.","color":"white","bold":false}]

execute if score $1.15 twvm.tool matches 1 run function thewii:autominer/install_2
execute if score $1.15 twvm.tool matches 0 run scoreboard objectives remove twvm.tool