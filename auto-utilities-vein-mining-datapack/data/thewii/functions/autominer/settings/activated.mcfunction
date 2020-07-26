execute unless score @s twvm.deactivated matches 1 run scoreboard players set @s twvm.deactivated 101
execute if score @s twvm.deactivated matches 1 run scoreboard players set @s twvm.deactivated 100

execute if score @s twvm.deactivated matches 101 run scoreboard players set @s twvm.deactivated 1
execute if score @s twvm.deactivated matches 100 run scoreboard players set @s twvm.deactivated 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show