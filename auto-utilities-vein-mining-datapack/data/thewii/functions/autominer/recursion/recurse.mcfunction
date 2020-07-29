# Add to max length
scoreboard players add $length twvm.tool 1

# Increase Damage
execute unless block ~ ~ ~ air run function thewii:autominer/damage/add

# Generate xp
execute unless score $silktouch twvm.tool matches 1 if block ~ ~ ~ #thewii:autominer/ores_xp run function thewii:autominer/xp/generate

# Spawn item
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

# Teleport to miner
execute if score @s twvm.dropitems matches 1 as @e[type=item,distance=..0.5,tag=!twvm.ore,tag=!global.ignore,tag=!global.ignore.pos,nbt={Age:0s}] run function thewii:autominer/recursion/teleport

# Break block
execute if score @s twvm.particles matches 1 run function thewii:autominer/break/particles
execute unless score @s twvm.particles matches 1 run setblock ~ ~ ~ air

# Recurse
execute if score @s twvm.method matches 0 run function thewii:autominer/recursion/ore
execute if score @s twvm.method matches 1 run function thewii:autominer/recursion/level