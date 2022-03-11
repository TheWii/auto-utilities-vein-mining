from ../objectives import math, temp

scoreboard players set #min math 0
scoreboard players set #max math 0

# Get min and max xp for current ore
for ore in ctx.meta.ores.values():
    oreXp = ore.get('xp')
    if not oreXp or oreXp == 0: # skip ores that do not give xp
        continue
    # Command to get xp range based on current block
    if block ~ ~ ~ ore.block expand:
        scoreboard players set #min math oreXp[0]
        scoreboard players set #max math oreXp[1]
    # Add ore to tag
    merge block_tag ../xp_ores {
        "values": [ ore.block ]
    }

# Scale range by 100 to increase precision
scoreboard players operation #min math *= #100 math
scoreboard players operation #max math *= #100 math
function ../rng/ranged
scoreboard players operation #output math /= #100 math

scoreboard players operation $xp temp += #output math