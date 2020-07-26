scoreboard players add @s twvm.method 1
execute unless score @s twvm.method matches 0..1 run scoreboard players set @s twvm.method 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show