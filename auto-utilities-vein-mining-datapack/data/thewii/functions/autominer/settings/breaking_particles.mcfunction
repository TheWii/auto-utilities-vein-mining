execute unless score @s twvm.particles matches 1 run scoreboard players set @s twvm.particles 101
execute if score @s twvm.particles matches 1 run scoreboard players set @s twvm.particles 100

execute if score @s twvm.particles matches 101 run scoreboard players set @s twvm.particles 1
execute if score @s twvm.particles matches 100 run scoreboard players set @s twvm.particles 0

execute if entity @s[tag=!global.ignore,tag=!global.ignore.gui] run function thewii:autominer/settings/show