
# RNG

## Init

```mcfunction
# @function ./rng/init
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set mathObj = pfx ~ 'math'

scoreboard objectives add {{mathObj}} dummy

scoreboard players set #lcg.multiplier {{mathObj}} 1630111353
scoreboard players set #-1 {{mathObj}} -1
scoreboard players set #2 {{mathObj}} 2
scoreboard players set #3 {{mathObj}} 3
scoreboard players set #100 {{mathObj}} 100
scoreboard players set #10000 {{mathObj}} 10000

function ./reset_seed
```

## Reset Seed

```mcfunction
# @function ./rng/reset_seed
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set mathObj = pfx ~ 'math'
#!set uuidTag = pfx ~ 'uuid'

# Summon AEC and grab its UUID
at @e[limit=1] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Tags:["{{uuidTag}}"]}

# Store UUID
store result score #lcg {{mathObj}}:
    data get entity @e[type=area_effect_cloud,tag={{uuidTag}},limit=1] UUID[0]

kill @e[type=area_effect_cloud,tag={{uuidTag}},limit=1]

# Invert if negative
if score #lcg {{mathObj}} matches ..-1:
    scoreboard players operation #lcg {{mathObj}} *= #-1 {{mathObj}}
```

## Simplified

```mcfunction
# @function ./rng/simplified
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set mathObj = pfx ~ 'math'
scoreboard players operation #lcg {{mathObj}} *= #lcg.multiplier {{mathObj}}
scoreboard players add #lcg {{mathObj}} 1623164762
scoreboard players operation #output {{mathObj}} = #lcg {{mathObj}}
```

## Ranged

```mcfunction
# @function ./rng/ranged
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set mathObj = pfx ~ 'math'
scoreboard players operation #range {{mathObj}} = #max {{mathObj}}
scoreboard players operation #range {{mathObj}} -= #min {{mathObj}}
scoreboard players add #range {{mathObj}} 1

scoreboard players operation #lcg {{mathObj}} *= #lcg.multiplier {{mathObj}}
scoreboard players add #lcg {{mathObj}} 1623164762
scoreboard players operation #output {{mathObj}} = #lcg {{mathObj}}

scoreboard players operation #output {{mathObj}} %= #range {{mathObj}}
scoreboard players operation #output {{mathObj}} += #min {{mathObj}}
```
