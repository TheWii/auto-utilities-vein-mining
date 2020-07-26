clone ~ ~ ~ ~ ~ ~ ~ 255 ~

setblock ~ ~ ~ air

scoreboard players set #gamerule twvm.tool 0
execute store result score #gamerule twvm.tool run gamerule doTileDrops
gamerule doTileDrops false

clone ~ 255 ~ ~ 255 ~ ~ ~ ~
setblock ~ ~ ~ air destroy

setblock ~ 255 ~ air

execute if score #gamerule twvm.tool matches 1 run gamerule doTileDrops true