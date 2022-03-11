from ../objectives import math
prefix = ctx.meta.prefix + '.'
uuidTag = prefix + 'uuid'

# Summon AEC and grab its UUID
at @e[limit=1] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Tags:[uuidTag]}

# Store UUID
store result score #lcg math:
    data get entity @e[type=area_effect_cloud,tag=uuidTag,limit=1] UUID[0]

kill @e[type=area_effect_cloud,tag=uuidTag,limit=1]

# Invert if negative
if score #lcg math matches ..-1:
    scoreboard players operation #lcg math *= #-1 math