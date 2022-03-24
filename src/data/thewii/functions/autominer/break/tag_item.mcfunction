import ../objectives as obj

oreTag = ctx.meta.prefix + '.ore'

# For each ore in every config namespace
for cfg in ctx.meta.config.namespaces.values():
    for name, ore in cfg.ores.items():
        if score @s obj.ores[name] matches 1.. expand:
            for item_nbt in ore.drops:
                # create a command for each item
                tag @e[type=item,limit=1,sort=nearest,distance=..1,
                    nbt={Age:0s,Item:item_nbt}] add oreTag

# Check if found
if entity @e[type=item,limit=1,sort=nearest,distance=..1,tag=oreTag]
    scoreboard players set #found obj.temp 1