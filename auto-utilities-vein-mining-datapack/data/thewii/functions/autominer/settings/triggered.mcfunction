execute if score @s AutoVeinMiner matches 1 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show
execute if score @s AutoVeinMiner matches 2 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/sneak
execute if score @s AutoVeinMiner matches 3 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/breaking_particles
execute if score @s AutoVeinMiner matches 4 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/activated
execute if score @s AutoVeinMiner matches 5 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/method
execute if score @s AutoVeinMiner matches 6 if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/dropitems

scoreboard players reset @s AutoVeinMiner
scoreboard players enable @s AutoVeinMiner