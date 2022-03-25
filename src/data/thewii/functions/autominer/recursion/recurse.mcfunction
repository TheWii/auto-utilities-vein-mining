import ../objectives as obj

pfx = ctx.meta.prefix + '.'
oreTag = pfx + 'ore'

scoreboard players add $length obj.temp 1

# Increase Damage
unless block ~ ~ ~ air run function ../damage/add

# Generate xp
unless score $silktouch obj.temp matches 1
    if block ~ ~ ~ #../xp_ores
    run function ../xp/generate

# Spawn item
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

# Teleport to miner
if score @s obj.dropItems matches 1
    as @e[type=item,distance=..0.5,tag=!oreTag,nbt={Age:0s}]
    run function ./teleport

# Break block with particles
if score @s obj.particles matches 1 run function ./particles
# Break block silently
unless score @s obj.particles matches 1 run setblock ~ ~ ~ air

# Recurse according to current method
if score $method obj.temp matches 0 run function ./ore
if score $method obj.temp matches 1 run function ./level