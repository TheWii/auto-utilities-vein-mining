# Install
execute unless data storage autominer:storage {FirstReload:1b} run function autominer:install

# Update
execute unless data storage autominer:storage {Version:"1.2"} run function autominer:update

# Check for Mechanization
execute store success score $mechanization twvm.tool if score $mech.ver load matches 1..
execute if score mechanization twvm.tool matches 1 unless data storage autominer:storage {Mechanization:1b} run function autominer:install_mechanization

# Check for 1.16
scoreboard players set $1.16 twvm.tool 0
function autominer:detect_1.16
execute if score $1.16 twvm.tool matches 1 run function autominer:install_netherupdate

# Load message
execute if score $mechanization twvm.tool matches 0 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"yellow","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"Version","storage":"autominer:storage","color":"white","bold":false},{"text":" is loaded.","color":"white","bold":false}]
execute if score $mechanization twvm.tool matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"yellow","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"Version","storage":"autominer:storage","color":"white","bold":false},{"text":" is loaded with Mechanization integration.","color":"white","bold":false}]

# Enable trigger
scoreboard players enable @a twvm.settings