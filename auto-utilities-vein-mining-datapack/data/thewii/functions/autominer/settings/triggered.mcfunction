execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] if score @s twvm.settings matches 1 run function thewii:autominer/settings/show
execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] if score @s twvm.settings matches 2 run function thewii:autominer/settings/sneak
execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] if score @s twvm.settings matches 3 run function thewii:autominer/settings/activated

scoreboard players reset @s twvm.settings
scoreboard players enable @s twvm.settings