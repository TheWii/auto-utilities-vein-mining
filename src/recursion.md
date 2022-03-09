
# Recursion

Main recursive function:

```mcfunction
# @function ./recursion/recurse
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set methodObj = pfx ~ 'method'
#!set tempObj = pfx ~ 'temp'
#!set oreTag = pfx ~ 'ore'

scoreboard players add $length {{tempObj}} 1

# Increase Damage
unless block ~ ~ ~ air run function ../damage/add

# Generate xp
unless score $silktouch {{tempObj}} matches 1
    if block ~ ~ ~ #../xp_ores
    run function ../xp/generate

# Spawn item
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

# Teleport to miner
if score @s {{pfx~'dropitems'}} matches 1
    as @e[type=item,distance=..0.5,tag=!{{oreTag}},nbt={Age:0s}]
    run function ./teleport

# Break block with particles
if score @s {{pfx~'particles'}} matches 1 run function ./particles
# Break block silently
unless score @s {{pfx~'particles'}} matches 1 run setblock ~ ~ ~ air

# Recurse according to current method
if score @s {{methodObj}} matches 0 run function ./ore
if score @s {{methodObj}} matches 1 run function ./level
```

## Recursion Methods

By mined ore (either tagged or single veins):

```mcfunction
# @function ./recursion/ore
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

# For each vein tag
#!for tag_name in ctx.meta.tags
    # id is the tag index
    #!set id = loop.index
    # Generate a function for current tag
    if score $level {{tempObj}} matches {{id}}
        run function ./ore/{{tag_name}}:
            # Generate command offset in a 3x3 grid
            # except at current block(~ ~ ~)
            #!for x in [0, 1, -1]
            #!for y in [0, 1, -1]
            #!for z in [0, 1, -1]
            #! if x or y or z
            unless score $length {{tempObj}} matches 256..
                unless score $damaged {{tempObj}} >= $durability {{tempObj}}
                positioned ~{{x}} ~{{y}} ~{{z}}
                if block ~ ~ ~ #../ore/{{tag_name}}
                run function ./recurse
            #!endif
            #!endfor
            #!endfor
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
#!set block_id = ctx.meta.ores[name].block
if score $level {{tempObj}} matches {{id}}
    run function ./ore/{{name}}:
        # Generate command offset in a 3x3 grid
        # except at current block(~ ~ ~)
        #!for x in [0, 1, -1]
        #!for y in [0, 1, -1]
        #!for z in [0, 1, -1]
        #! if x or y or z
        unless score $length {{tempObj}} matches 256..
            unless score $damaged {{tempObj}} >= $durability {{tempObj}}
            positioned ~{{x}} ~{{y}} ~{{z}}
            if block ~ ~ ~ {{block_id}}
            run function ./recurse
        #!endif
        #!endfor
        #!endfor
        #!endfor
#!endfor
```

By mining level (tier):

```mcfunction
# @function ./recursion/level
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'
#!for level in ctx.meta.mining_levels
if score $level {{tempObj}} matches {{level}}
    run function ./level/{{level}}:
        # Generate command offset in a 3x3 grid
        # except at current block(~ ~ ~)
        #!for x in [0, 1, -1]
        #!for y in [0, 1, -1]
        #!for z in [0, 1, -1]
        #! if x or y or z
        unless score $length {{tempObj}} matches 256..
            unless score $damaged {{tempObj}} >= $durability {{tempObj}}
            positioned ~{{x}} ~{{y}} ~{{z}}
            if block ~ ~ ~ #../level/{{level}}
            run function ./recurse
        #!endif
        #!endfor
        #!endfor
        #!endfor
#!endfor
```

## Teleport

```mcfunction
# @function ./recursion/teleport
#!set pfx = ctx.meta.objective_prefix ~ '.'
data modify entity @s PickupDelay set value 0s
tp @s @p[tag={{pfx~'selector'}}]
```

## Particles

```mcfunction
# @function ./recursion/particles
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

# Clone block up
clone ~ ~ ~ ~ ~ ~ ~ 255 ~
# Remove block (Drop supported blocks like torches, rails etc)
setblock ~ ~ ~ air

# Disable tile drops
execute store result score #gamerule {{tempObj}} run gamerule doTileDrops
gamerule doTileDrops false

# Clone block back down and destroy with particles
clone ~ 255 ~ ~ 255 ~ ~ ~ ~
setblock ~ ~ ~ air destroy

# Clear saved block
setblock ~ 255 ~ air

# Reset gamerule to its initial state
execute if score #gamerule {{tempObj}} matches 1 run gamerule doTileDrops true
```
