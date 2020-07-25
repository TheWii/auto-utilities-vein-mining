execute unless score @s tw.vm.sneak matches 1 run scoreboard players set @s tw.vm.sneak 101
execute if score @s tw.vm.sneak matches 1 run scoreboard players set @s tw.vm.sneak 100

execute if score @s tw.vm.sneak matches 101 run scoreboard players set @s tw.vm.sneak 1
execute if score @s tw.vm.sneak matches 100 run scoreboard players set @s tw.vm.sneak 0

function autominer:settings/show