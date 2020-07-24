summon minecraft:experience_orb ~ ~ ~ {Tags:["twvm.xp"]}

execute store result entity @e[type=minecraft:experience_orb,limit=1,sort=nearest,tag=twvm.xp] Value short 1 run scoreboard players get $xp twvm.tool

tag @e[type=minecraft:experience_orb,tag=twvm.xp,limit=1] remove twvm.xp
