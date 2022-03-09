
# Break

## Check sneaking

```mcfunction
# @function ./break/check_sneaking
#! set root = generate_path('')
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'
#!set sneakObj = pfx ~ 'sneak'
#!set deactivatedObj = pfx ~ 'deactivated'

#TODO Plugin to handle score holders?
scoreboard players reset $custom_dur {{tempObj}}
scoreboard players reset $keep_broken {{tempObj}}
scoreboard players reset $xp {{tempObj}}
scoreboard players reset $current_damage {{tempObj}}
scoreboard players reset $damage {{tempObj}}
scoreboard players reset $damaged {{tempObj}}
scoreboard players reset $unbreaking {{tempObj}}
scoreboard players reset $unbreakable {{tempObj}}
scoreboard players reset $silktouch {{tempObj}}
scoreboard players reset $durability {{tempObj}}
scoreboard players reset $level {{tempObj}}
scoreboard players reset $length {{tempObj}}

# Defaults to 0
unless score @s {{sneakObj}} matches 0..2 run scoreboard players set @s {{sneakObj}} 0

# Different condition handling depending on the sneak setting
# Unless the deactivated setting is enabled
unless score @s {{deactivatedObj}} matches 1.. expand:
    if score @s {{sneakObj}} matches 0 unless predicate ../is_sneaking run function ./find
    if score @s {{sneakObj}} matches 1 if predicate ../is_sneaking run function ./find
    if score @s {{sneakObj}} matches 2 run function ./find

# Reset scores
#!for name, _ in ctx.meta.ores.items()
scoreboard players reset @s {{pfx ~ name}}
#!endfor
```

## Find

```mcfunction
# @function ./break/find
#!set root = generate_path('')
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

scoreboard players set #found {{tempObj}} 0

anchored eyes positioned ^ ^ ^ run function ./raycast:
    # If finds item, then tag it
    if entity @e[type=item,limit=1,sort=nearest,distance=..1,nbt={Age:0s}]
        run function ./tag_item
    # Else step and recurse only if not found item
    unless score #found {{tempObj}} matches 1
        positioned ^ ^ ^0.25
        if entity @s[distance=..7]
        run function ./raycast

if score #found {{tempObj}} matches 1 expand:
    data modify storage ../temp SelectedItem set from entity @s SelectedItem
    store success score $custom_dur {{tempObj}} if data storage ./temp SelectedItem.tag.ctc.tool.durability
    unless score $custom_dur {{tempObj}} matches 1 if data storage ../temp SelectedItem run function ./start
```

## Tag Item

```mcfunction
# @function ./break/tag_item
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set oreTag = pfx ~ 'ore'

# For each ore in meta.ores
#!for name, ore in ctx.meta.ores.items()
execute if score @s {{pfx ~ name}} matches 1.. expand:
    # loop through every drop including the ore block
    #!for item in ore.drops + [ ore.block ]

    # create a command for each item
    #!set nbt = '{Age:0s,Item:{id:"' ~ item ~ '"}}'
    tag @e[type=item,limit=1,sort=nearest,distance=..1,nbt={{nbt}}] add {{oreTag}}

    #!endfor
#!endfor

# Check if found
if entity @e[type=item,limit=1,sort=nearest,distance=..1,tag={{oreTag}}]
    scoreboard players set #found {{pfx~'temp'}} 1
```

## Start

```mcfunction
# @function ./break/start
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set methodObj = pfx ~ 'method'
#!set tempObj = pfx ~ 'temp'
#!set selfTag = pfx ~ 'selector'
#!set oreTag = pfx ~ 'ore'

# Tag executer
tag @s add {{selfTag}}

# Store mainhand and get tool info
data modify storage ../temp SelectedItem set from entity @s SelectedItem
function ../damage/get

# Get level by selected method
unless score @s {{methodObj}} matches 0..1 run scoreboard players set @s {{methodObj}} 0
if score @s {{methodObj}} matches 0 run function ./method_ore
if score @s {{methodObj}} matches 1 run function ./method_level

# Prepare recursion
scoreboard players operation $damaged {{tempObj}} = $current_damage {{tempObj}}
scoreboard players operation $damaged {{tempObj}} += $damage {{tempObj}}
scoreboard players set $length {{tempObj}} 0

# Start recursion at dropped item
unless score $custom_dur {{tempObj}} matches 1
    unless score $damaged {{tempObj}} >= $durability {{tempObj}}
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag={{oreTag}}]
    run function ../recursion/recurse

# Summon xp at the block position
if score $xp {{tempObj}} matches 1..
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag={{oreTag}}]
    run function ../xp/summon

# Damage tool
if score $damage {{tempObj}} matches 1..
    unless score $unbreakable {{tempObj}} matches 1
    run function ../damage/replace

# Teleport xp/item of ore that triggered the vein mining.
if score @s {{pfx~'dropitems'}} matches 1 expand:
    at @e[type=item,limit=1,sort=nearest,distance=..8,tag={{oreTag}}]
        run tp @e[type=experience_orb,distance=..0.5] @s
    as @e[type=item,limit=1,sort=nearest,distance=..8,tag={{oreTag}}]
        at @s run function ../recursion/teleport

# Untag item
tag @e[type=item,limit=1,sort=nearest,distance=..8,tag={{oreTag}}] remove {{oreTag}}

# Clear storage
data remove storage ../temp SelectedItem

# Remove selector tag
tag @s remove {{selfTag}}
```

## Methods

By mined ore (either tagged or single veins):

```mcfunction
# @function ./break/method_ore
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

# For each vein tag
#!for tag in ctx.meta.tags
    # id is the tag index
    #!set id = loop.index

    # get all ores that belong to the current tag
    #!for name, ore in ctx.meta.ores.items()
        #!if ore.tag == tag
        if score @s {{pfx ~ name}} matches 1..
            scoreboard players set $level {{tempObj}} {{id}}
        #!endif
    #!endfor

#!endfor

# For single ores

# Get all single ores
#!set singleOres = []
#!for name, ore in ctx.meta.ores.items()
    #!if not ore.tag
    # {{ singleOres.append(name) }}
    #!endif
#!endfor

# Loop through all single ores
# Ids will start from the last id (last tag index)
#!for name in singleOres
#!set id = ctx.meta.tags|length + loop.index
if score @s {{pfx ~ name}} matches 1..
    scoreboard players set $level {{tempObj}} {{id}}
#!endfor
```

By mining level (specified in "mining_tiers"):

```mcfunction
# @function ./break/method_level
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

# For every mining tier
#!for tool_id, tool in ctx.meta.tools.items()
    if data storage ../temp SelectedItem{id:"{{tool_id}}"}
        scoreboard players set $level {{tempObj}} {{tool.level}}
#!endfor
```
