
# Settings

## Triggered

```mcfunction
# @function ./settings/triggered
if score @s AutoVeinMiner matches 1 run function ./show
if score @s AutoVeinMiner matches 2 run function ./field/sneak
if score @s AutoVeinMiner matches 3 run function ./field/particles
if score @s AutoVeinMiner matches 4 run function ./field/deactivated
if score @s AutoVeinMiner matches 5 run function ./field/method
if score @s AutoVeinMiner matches 6 run function ./field/dropitems
if score @s AutoVeinMiner matches 7 run function ./field/safe_break

scoreboard players reset @s AutoVeinMiner
scoreboard players enable @s AutoVeinMiner
```

## Show

```mcfunction
# @function ./settings/show
#!set root = generate_path('')
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set mathObj = pfx ~ 'math'

#TODO Proper json component parsing
tellraw @s [{"text":"              ","strikethrough":true,"color":"green"},{"text":" Auto Utilities: Vein Mining Settings ","color":"white","strikethrough":false,"bold":true},{"text":"              ","strikethrough":true,"color":"green"}]
tellraw @s ["\n",{"text": "Your Personal Preferences:","color":"white","bold": true,"hoverEvent":{"action":"show_text","value":["",{"text":"Every player has their own preferences.","color":"white"}]}},"\n"]

unless score @s {{pfx~'deactivated'}} matches 1 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining is activated.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 4"}}]
if score @s {{pfx~'deactivated'}} matches 1 run tellraw @s [{"text":"Vein miner: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining is activated.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 4"}}]

unless score @s {{pfx~'method'}} matches 1 run tellraw @s ["\n",{"text":"Vein Method: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How mining will treat veins.","color":"white"}]}},{"text":"[Same ore only]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 5"}}]
if score @s {{pfx~'method'}} matches 1 run tellraw @s ["\n",{"text":"Vein Method: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How mining will treat veins.","color":"white"}]}},{"text":"[All connected ores]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 5"}}]

unless score @s {{pfx~'sneak'}} matches 1..2 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Disables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 2"}}]
if score @s {{pfx~'sneak'}} matches 1 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Enables vein mining]","color":"white","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 2"}}]
if score @s {{pfx~'sneak'}} matches 2 run tellraw @s [{"text":"Sneak: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"How sneaking will affect vein mining.","color":"white"}]}},{"text":"[Ignored]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 2"}}]

unless score @s {{pfx~'particles'}} matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether blocks are broken with particles or silently.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 3"}}]
if score @s {{pfx~'particles'}} matches 1 run tellraw @s [{"text":"Breaking particles: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether blocks are broken with particles or silently.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 3"}}]

unless score @s {{pfx~'dropitems'}} matches 1 run tellraw @s [{"text":"Teleport items: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether items are immediately teleported to miner.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 6"}}]
if score @s {{pfx~'dropitems'}} matches 1 run tellraw @s [{"text":"Teleport items: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether items are immediately teleported to miner.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 6"}}]

if score @s {{pfx~'safe_break'}} matches 1 run tellraw @s [{"text":"Safety Break: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining will stop before the tool breaks.","color":"white"}]}},{"text":"[Disabled]","color":"red","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 7"}}]
unless score @s {{pfx~'safe_break'}} matches 1 run tellraw @s [{"text":"Safety Break: ","color":"gray","bold":false,"hoverEvent":{"action":"show_text","value":["",{"text":"Whether vein mining will stop before the tool breaks.","color":"white"}]}},{"text":"[Enabled]","color":"green","bold":false,"clickEvent":{"action":"run_command","value":"/trigger AutoVeinMiner set 7"}}]

tellraw @s ["",{"text":"\n\n\n\n\n\n"}]
tellraw @s [{"text":"Version "},{"nbt":"Version","storage":"{{root}}data"}]
tellraw @s [{"text":"                                                                                ","strikethrough":true,"color":"green"}]

playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 0.75

# Generate setting field triggers
#!set fields = {
    'deactivated': 2,
    'method': 2,
    'sneak': 3,
    'particles': 2,
    'dropitems': 2,
    'safe_break': 2
}
#!for name, amount in fields.items()
function ./field/{{name}}:
    scoreboard players add @s {{pfx ~ name}} 1
    scoreboard players operation @s {{pfx ~ name}} %= #{{amount}} {{mathObj}}
    function ./show
#!endfor
```
