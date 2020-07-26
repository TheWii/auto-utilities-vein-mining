clone ~ ~ ~ ~ ~ ~ 29999983 0 4322

setblock ~ ~ ~ air

scoreboard players set #gamerule twvm.tool 0
execute store result score #gamerule twvm.tool run gamerule doTileDrops
gamerule doTileDrops false

clone 29999983 0 4322 29999983 0 4322 ~ ~ ~
setblock ~ ~ ~ air destroy

execute if score #gamerule twvm.tool matches 1 run gamerule doTileDrops true