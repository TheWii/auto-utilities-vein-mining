import ../objectives as obj

oreTag = ctx.meta.prefix + '.ore'

# For each ore in every config namespace
for cfg in ctx.meta.config.namespaces.values():
    for name in cfg.ores.keys():
        ore = cfg.ores[name]
        if score @s obj.ores[name] matches 1.. expand:
            # loop through every drop including the ore block
            for itemId in ore.drops + [ ore.block ]:
                # create a command for each item
                tag @e[type=item,limit=1,sort=nearest,distance=..1,
                    nbt={Age:0s,Item:{id:itemId}}] add oreTag

# Check if found
if entity @e[type=item,limit=1,sort=nearest,distance=..1,tag=oreTag]
    scoreboard players set #found obj.temp 1