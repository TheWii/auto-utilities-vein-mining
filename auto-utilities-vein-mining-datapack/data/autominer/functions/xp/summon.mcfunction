summon minecraft:experience_orb ~ ~ ~ {Tags:["tw.vm.xp"]}

execute store result entity @e[type=minecraft:experience_orb,limit=1,sort=nearest,tag=tw.vm.xp] Value short 1 run scoreboard players get $xp tw.vm.tool

tag @e[type=minecraft:experience_orb,tag=tw.vm.xp,limit=1] remove tw.vm.xp
