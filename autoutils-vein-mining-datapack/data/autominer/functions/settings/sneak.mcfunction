execute unless score @s twvm.sneak matches 1 run scoreboard players set @s twvm.sneak 101
execute if score @s twvm.sneak matches 1 run scoreboard players set @s twvm.sneak 100

execute if score @s twvm.sneak matches 101 run scoreboard players set @s twvm.sneak 1
execute if score @s twvm.sneak matches 100 run scoreboard players set @s twvm.sneak 0

function autominer:settings/show