scoreboard players add @s twvm.sneak 1
execute unless score @s twvm.sneak matches 0..2 run scoreboard players set @s twvm.sneak 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show