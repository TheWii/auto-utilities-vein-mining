selfTag = ctx.meta.prefix + '.self'

data modify entity @s PickupDelay set value 0s
tp @s @p[tag=selfTag]