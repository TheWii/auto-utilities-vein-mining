execute if score @s twvm.activated matches 0 run scoreboard players set @s twvm.activated 101
execute if score @s twvm.activated matches 1 run scoreboard players set @s twvm.activated 100

execute if score @s twvm.activated matches 101 run scoreboard players set @s twvm.activated 1
execute if score @s twvm.activated matches 100 run scoreboard players set @s twvm.activated 0

function thewii:autominer/settings/show