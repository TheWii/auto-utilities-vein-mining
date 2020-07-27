scoreboard players add @s twvm.dropitems 1
execute unless score @s twvm.dropitems matches 0..1 run scoreboard players set @s twvm.dropitems 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show