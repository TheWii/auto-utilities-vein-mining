#!set pfx = ctx.meta.objective_prefix ~ '.'
from ../objectives import temp

# Clone block up
clone ~ ~ ~ ~ ~ ~ ~ 255 ~
# Remove block (Drop supported blocks like torches, rails etc)
setblock ~ ~ ~ air

# Disable tile drops
execute store result score #gamerule temp run gamerule doTileDrops
gamerule doTileDrops false

# Clone block back down and destroy with particles
clone ~ 255 ~ ~ 255 ~ ~ ~ ~
setblock ~ ~ ~ air destroy

# Clear saved block
setblock ~ 255 ~ air

# Reset gamerule to its initial state
execute if score #gamerule temp matches 1 run gamerule doTileDrops true
