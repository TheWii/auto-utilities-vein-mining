scoreboard objectives remove twvm.tool

scoreboard objectives remove twvm.coal
scoreboard objectives remove twvm.iron
scoreboard objectives remove twvm.gold
scoreboard objectives remove twvm.lapis
scoreboard objectives remove twvm.redstone
scoreboard objectives remove twvm.diamond
scoreboard objectives remove twvm.emerald
scoreboard objectives remove twvm.quartz

scoreboard objectives remove twvm.nthr.gold
scoreboard objectives remove twvm.debris
scoreboard objectives remove twvm.gilded

scoreboard objectives remove twvm.tin
scoreboard objectives remove twvm.copper
scoreboard objectives remove twvm.uranium
scoreboard objectives remove twvm.titanium

scoreboard objectives remove AutoVeinMiner
scoreboard objectives remove twvm.sneak
scoreboard objectives remove twvm.particles
scoreboard objectives remove twvm.deactivated
scoreboard objectives remove twvm.method
scoreboard objectives remove twvm.dropitems

# Forceload chunk
execute unless data storage thewii:autominer/data {Installed:0b} run function thewii:vp_library/loaded_chunk/remove

execute if entity @s[type=player] run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"red","bold":true},{"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},{"nbt":"Version","storage":"thewii:autominer/data","color":"white","bold":false},{"text":" was uninstalled.","color":"white","bold":false}]

data merge storage thewii:autominer/data {FirstReload:1b,Installed:0b}
data remove storage thewii:autominer/data Version
data remove storage thewii:autominer/data Mechanization
data remove storage thewii:autominer/data NetherUpdate