function autominer:damage/get

tag @e[type=item,limit=1,sort=nearest,distance=..8,nbt={Age:0s,Item:{tag:{OreDict:["oreUranium"]}}}] add tw.vm.ore
tag @e[type=item,limit=1,sort=nearest,distance=..8,nbt={Age:0s,Item:{tag:{OreDict:["ingotUranium"]}}}] add tw.vm.ore

execute if score $limit tw.vm.tool matches ..59 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] run function autominer:loop_level/wooden
execute if score $limit tw.vm.tool matches 131 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] run function autominer:loop_level/stone
execute if score $limit tw.vm.tool matches 250 at @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] run function autominer:loop_level/iron
execute if score $limit tw.vm.tool matches 1561.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] run function autominer:loop_level/diamond

execute if score $xp tw.vm.tool matches 1.. at @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] run function autominer:xp/summon

tag @e[type=item,limit=1,sort=nearest,distance=..8,tag=tw.vm.ore] remove tw.vm.ore

execute unless score $unbreaking tw.vm.tool matches -1 if score $damage tw.vm.tool matches 1.. run function autominer:damage/replace

scoreboard players reset $xp tw.vm.tool
scoreboard players reset $damage tw.vm.tool
scoreboard players reset $damaged tw.vm.tool
scoreboard players reset $unbreaking tw.vm.tool
scoreboard players reset $silktouch tw.vm.tool
scoreboard players reset $limit tw.vm.tool
scoreboard players reset @s tw.vm.tool