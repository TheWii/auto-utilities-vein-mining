tellraw @s [{"text":"- Auto Utilities: Vein Mining -","color":"white","bold":true}]

execute unless score @s tw.vm.sneak matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false},{"text":"[Disables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger tw.vm.settings set 2"}}]
execute if score @s tw.vm.sneak matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false},{"text":"[Enables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger tw.vm.settings set 2"}}]

execute unless score @s tw.vm.particles matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false},{"text":"[OFF]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger tw.vm.settings set 3"}}]
execute if score @s tw.vm.particles matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false},{"text":"[ON]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger tw.vm.settings set 3"}}]

playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 0.75