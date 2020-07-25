execute unless score @s tw.vm.particles matches 1 run scoreboard players set @s tw.vm.particles 101
execute if score @s tw.vm.particles matches 1 run scoreboard players set @s tw.vm.particles 100

execute if score @s tw.vm.particles matches 101 run scoreboard players set @s tw.vm.particles 1
execute if score @s tw.vm.particles matches 100 run scoreboard players set @s tw.vm.particles 0

function autominer:settings/show