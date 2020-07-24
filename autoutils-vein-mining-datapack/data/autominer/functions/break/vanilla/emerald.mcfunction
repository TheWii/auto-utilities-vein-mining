scoreboard players set $length twvm.tool 0

function autominer:damage/get

tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=!global.ignore,nbt={Age:0s,Item:{id:"minecraft:emerald_ore"}}] add twvm.ore
tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=!global.ignore,nbt={Age:0s,Item:{id:"minecraft:emerald"}}] add twvm.ore

execute if score $limit twvm.tool matches 250 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function autominer:loop_level/iron
execute if score $limit twvm.tool matches 1561.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function autominer:loop_level/diamond

execute if score $xp twvm.tool matches 1.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] run function autominer:xp/summon

tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=twvm.ore] remove twvm.ore

execute unless score $unbreakable twvm.tool matches 1 if score $damage twvm.tool matches 1.. run function autominer:damage/replace

scoreboard players reset $xp twvm.tool
scoreboard players reset $damage twvm.tool
scoreboard players reset $damaged twvm.tool
scoreboard players reset $unbreaking twvm.tool
scoreboard players reset $unbreakable twvm.tool
scoreboard players reset $silktouch twvm.tool
scoreboard players reset $limit twvm.tool
scoreboard players reset $length twvm.tool
scoreboard players reset @s twvm.tool