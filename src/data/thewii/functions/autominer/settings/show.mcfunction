import ../objectives as obj
#TODO Proper json component parsing

tellraw @s [{"text":"              ","strikethrough":true,"color":"green"},{"text":" Auto Utilities: Vein Mining Settings ","color":"white","strikethrough":false,"bold":true},{"text":"              ","strikethrough":true,"color":"green"}]
tellraw @s ["\n",{"text": "Your Personal Preferences:","color":"white","bold": true,"hoverEvent":{"action":"show_text","value":["",{"text":"Every player has their own preferences.","color":"white"}]}},"\n"]

unless score @s obj.deactivated matches 1 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining is activated.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 2"}}]
if score @s obj.deactivated matches 1 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining is activated.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 2"}}]

unless score @s obj.method matches 1 run tellraw @s ["\n",{"text":"Vein Method: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How mining will treat veins.","color":"white"}]}},{"text":"[Same ore only]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 3"}}]
if score @s obj.method matches 1 run tellraw @s ["\n",{"text":"Vein Method: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How mining will treat veins.","color":"white"}]}},{"text":"[All connected ores]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 3"}}]

unless score @s obj.sneak matches 1..2 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Disables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 4"}}]
if score @s obj.sneak matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Enables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 4"}}]
if score @s obj.sneak matches 2 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Ignored]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 4"}}]

unless score @s obj.particles matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether blocks are broken with particles or silently.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 5"}}]
if score @s obj.particles matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether blocks are broken with particles or silently.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 5"}}]

unless score @s obj.dropItems matches 1 run tellraw @s [{"text":"Teleport items: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether items are immediately teleported to miner.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 6"}}]
if score @s obj.dropItems matches 1 run tellraw @s [{"text":"Teleport items: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether items are immediately teleported to miner.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 6"}}]

if score @s obj.safeBreak matches 1 run tellraw @s [{"text":"Safety Break: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining will stop before the tool breaks.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 7"}}]
unless score @s obj.safeBreak matches 1 run tellraw @s [{"text":"Safety Break: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining will stop before the tool breaks.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 7"}}]

tellraw @s ["",{"text":"\n\n\n\n\n\n"}]
tellraw @s [{"text":"Version "},{"nbt":"Version","storage":f"{generate_path('')}data"}]
tellraw @s [{"text":"                                                                                ","strikethrough":true,"color":"green"}]

playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 0.75