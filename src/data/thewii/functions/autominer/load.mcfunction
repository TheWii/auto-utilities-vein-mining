import ./objectives as obj
from ./utils/path import getPath

function_tag minecraft:load {
    "values": [ getPath() ]
}


obj.addSingle(obj.dpData)
scoreboard players set $installed obj.dpData 0

function ./detect/1.18

#TODO Use proper json component parsing
#TODO Use lantern load plugin
if score $1.18 obj.dpData matches 1 run function ./load_2:
   function ./install
   schedule function ./post_load 1t
   tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
       {"text":"[Datapack]: ","color":"yellow","bold":true},
       {"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},
       {"nbt":"Version","storage":f"{generate_path('')}data","color":"white","bold":false},
       {"text":" is loaded!!!!","color":"white","bold":false}
    ]

if score $1.18 obj.dpData matches 0 expand:
    tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
        {"text":"[Datapack]: ","color":"red","bold":true},
        {"text":"Auto Utilities: Vein Mining v4.0 failed to be loaded. Either upgrade to Minecraft 1.18+ or use an older version of this data pack. ","color":"white","bold":false},
        {"text":"(Download for 1.16.2-1.17)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v3.0"}},
        " ",
        {"text":"(Download for 1.16.1 or older)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v2.0"}}
    ]
    scoreboard objectives remove obj.dpData