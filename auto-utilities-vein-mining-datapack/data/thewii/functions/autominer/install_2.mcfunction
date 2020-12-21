# Objectives
scoreboard objectives add twvm.tool dummy

scoreboard objectives add twvm.coal minecraft.mined:minecraft.coal_ore
scoreboard objectives add twvm.iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add twvm.gold minecraft.mined:minecraft.gold_ore
scoreboard objectives add twvm.lapis minecraft.mined:minecraft.lapis_ore
scoreboard objectives add twvm.redstone minecraft.mined:minecraft.redstone_ore
scoreboard objectives add twvm.diamond minecraft.mined:minecraft.diamond_ore
scoreboard objectives add twvm.emerald minecraft.mined:minecraft.emerald_ore
scoreboard objectives add twvm.quartz minecraft.mined:minecraft.nether_quartz_ore

scoreboard objectives add AutoVeinMiner trigger
scoreboard players enable @a AutoVeinMiner

scoreboard objectives add twvm.sneak dummy
scoreboard objectives add twvm.particles dummy
scoreboard objectives add twvm.deactivated dummy
scoreboard objectives add twvm.method dummy
scoreboard objectives add twvm.dropitems dummy
scoreboard objectives add twvm.safe_break dummy

execute store success score $mechanization twvm.tool if score $mech.ver load matches 1..
execute if score $mechanization twvm.tool matches 1 unless data storage thewii:autominer/data {Mechanization:1b} run function thewii:autominer/install_mechanization

# Check for 1.16
scoreboard players set $1.16 twvm.tool 0
function thewii:autominer/detect_1.16
execute if score $1.16 twvm.tool matches 1 run function thewii:autominer/install_netherupdate

# Check for 1.17
scoreboard players set $1.17 twvm.tool 0
function thewii:autominer/detect_1.17
execute if score $1.17 twvm.tool matches 1 run function thewii:autominer/install_caveupdate

# Forceload chunk
execute unless data storage thewii:autominer/data {Installed:1b} run function thewii:vp_library/loaded_chunk/add

# Post load
schedule function thewii:autominer/post_load 1t

scoreboard players set $installed twvm.tool 1
data merge storage thewii:autominer/data {FirstReload:1b,Version:"2.1",Installed:1b}
execute if entity @s[type=minecraft:player] run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"green","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"Version","storage":"thewii:autominer/data","color":"white","bold":false},{"text":" was installed!","color":"white","bold":false}]
