execute if score @s twvm.settings matches 1 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show
execute if score @s twvm.settings matches 2 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/sneak
execute if score @s twvm.settings matches 3 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/breaking_particles
execute if score @s twvm.settings matches 4 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/activated

scoreboard players reset @s twvm.settings
scoreboard players enable @s twvm.settings