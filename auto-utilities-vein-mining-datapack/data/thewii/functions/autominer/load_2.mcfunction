# Update
execute if data storage autominer:storage version run function thewii:autominer/update

# Install
execute unless data storage thewii:autominer/data {firstReload:1b} run function thewii:autominer/install

# Check for 1.16
scoreboard players set $1.16 twvm.tool 0
function thewii:autominer/detect_1.16
execute if score $1.16 twvm.tool matches 1 run function thewii:autominer/install_netherupdate

# Load message
execute unless score #updated twvm.tool matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"yellow","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"version","storage":"thewii:autominer/data","color":"white","bold":false},{"text":" is loaded.","color":"white","bold":false}]
scoreboard players reset #updated twvm.tool

# Enable trigger
scoreboard players enable @a AutoVeinMiner

# Lantern load
execute if data storage thewii:autominer/data {installed:1b} run scoreboard players set #thewii.autoutils_vein_mining load 020000

# Post load
schedule function thewii:autominer/post_load 1t