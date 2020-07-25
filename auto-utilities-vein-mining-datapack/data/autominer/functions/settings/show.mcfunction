tellraw @s [{"text":"- Auto Utilities: Vein Mining -","color":"white","bold":true}]

execute if score @s twvm.activated matches 0 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger twvm.settings set 4"}}]
execute if score @s twvm.activated matches 1 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger twvm.settings set 4"}}]

execute unless score @s twvm.sneak matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false},{"text":"[Disables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger twvm.settings set 2"}}]
execute if score @s twvm.sneak matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false},{"text":"[Enables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger twvm.settings set 2"}}]

playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 0.75