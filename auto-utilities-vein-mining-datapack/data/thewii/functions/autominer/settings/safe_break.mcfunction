scoreboard players add @s twvm.safe_break 1
execute unless score @s twvm.safe_break matches 0..1 run scoreboard players set @s twvm.safe_break 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show