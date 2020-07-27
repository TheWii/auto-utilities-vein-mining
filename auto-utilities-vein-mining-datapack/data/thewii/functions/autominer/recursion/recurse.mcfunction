scoreboard players add $length twvm.tool 1

execute unless block ~ ~ ~ air run function thewii:autominer/damage/add

execute unless score $silktouch twvm.tool matches 1 if block ~ ~ ~ #thewii:autominer/ores_xp run function thewii:autominer/xp/generate

loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
execute if score @s twvm.dropitems matches 1 as @e[type=item,tag=!twvm.ore,distance=..0.5,nbt={Age:0s}] run function thewii:autominer/recursion/teleport

execute if score @s twvm.particles matches 1 run function thewii:autominer/break/particles
execute unless score @s twvm.particles matches 1 run setblock ~ ~ ~ air

execute if score @s twvm.method matches 0 run function thewii:autominer/recursion/ore
execute if score @s twvm.method matches 1 run function thewii:autominer/recursion/level