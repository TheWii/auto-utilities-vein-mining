execute if score @s tw.vm.settings matches 1 run function autominer:settings/show
execute if score @s tw.vm.settings matches 2 run function autominer:settings/sneak
execute if score @s tw.vm.settings matches 3 run function autominer:settings/breaking_particles

scoreboard players reset @s tw.vm.settings
scoreboard players enable @s tw.vm.settings