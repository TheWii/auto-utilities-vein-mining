
# XP

## Generate

```mcfunction
# @function ./xp/generate
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'
#!set mathObj = pfx ~ 'math'

scoreboard players set #min {{mathObj}} 0
scoreboard players set #max {{mathObj}} 0

# Get min and max xp for current ore
#!for ore in ctx.meta.ores.values()
#!if ore.xp
if block ~ ~ ~ {{ore.block}} expand:
    scoreboard players set #min {{mathObj}} {{ore.xp[0]}}
    scoreboard players set #max {{mathObj}} {{ore.xp[1]}}
#!endif
#!endfor

# Scale range by 100 to increase precision
scoreboard players operation #min {{mathObj}} *= #100 {{mathObj}}
scoreboard players operation #max {{mathObj}} *= #100 {{mathObj}}
function ../rng/ranged
scoreboard players operation #output {{mathObj}} /= #100 {{mathObj}}

scoreboard players operation $xp {{tempObj}} += #output {{mathObj}}
```

```mcfunction
# @function ./xp/summon
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'
#!set dropItensObj = pfx ~ 'dropitems'
#!set xpTag = pfx ~ 'xp'
if score @s {{dropItensObj}} matches 1 at @s:
    summon experience_orb ~ ~ ~ {Tags:["{{xpTag}}"]}
unless score @s {{dropItensObj}} matches 1:
    summon experience_orb ~ ~ ~ {Tags:["{{xpTag}}"]}

store result entity @e[type=experience_orb,limit=1,tag={{xpTag}}] Value short 1:
    scoreboard players get $xp {{tempObj}}

tag @e[type=experience_orb,tag={{xpTag}},limit=1] remove {{xpTag}}

```
