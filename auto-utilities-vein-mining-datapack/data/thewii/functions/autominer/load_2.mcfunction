#> thewii:autominer/load_2

# Datapack version
scoreboard players set $thewii.autoutils_vein_mining load 040000

# Install
function thewii:autominer/install


# Post load
schedule function thewii:autominer/post_load 1t

# Load message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"yellow","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"Version","storage":"thewii:autominer/data","color":"white","bold":false},{"text":" is loaded.","color":"white","bold":false}]
