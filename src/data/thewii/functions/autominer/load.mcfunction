import ./objectives as obj
from ./utils/path import getPath

obj.addSingle(obj.dpData)
scoreboard players set $installed obj.dpData 0

function ./detect/1.18
function ./detect/1.17
function ./detect/1.16.2

def resolve_condition(cond, index=0):
    curr = cond[index]
    if len(cond) > (index+1):
        if curr.type == "version":
            if score f"${curr.min}" obj.dpData matches 1:
                resolve_condition(cond, index+1)
        if curr.type == "score":
            if score curr.name curr.objective matches curr.value:
                resolve_condition(cond, index+1)
        if curr.type == "predicate":
            if predicate curr.value:
                resolve_condition(cond, index+1)
    else:
        if curr.type == "version":
            if score f"${curr.min}" obj.dpData matches 1
        if curr.type == "score":
            if score curr.name curr.objective matches curr.value
        if curr.type == "predicate":
            if predicate curr.value

#TODO Use proper json component parsing
#TODO Use lantern load plugin
if score $1.16.2 obj.dpData matches 1 run function ./load_2:
    # store scores of all config extensions
    for id, cfg in ctx.meta.config.namespaces.items():
        if cfg.get("condition"):
            store result score f"$load.{id}" obj.dpData:
                resolve_condition(cfg.condition)
        else:
            scoreboard players set f"$load.{id}" obj.dpData 1
    function ./install
    schedule function ./post_load 1t
   tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
       {"text":"[Datapack]: ","color":"yellow","bold":true},
       {"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},
       {"nbt":"Version","storage":f"{generate_path('')}data","color":"white","bold":false},
       {"text":" is loaded!!!!","color":"white","bold":false}
    ]

if score $1.16.2 obj.dpData matches 0 expand:
    tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
        {"text":"[Datapack]: ","color":"red","bold":true},
        {"text":"Auto Utilities: Vein Mining v4.0 failed to be loaded. Either upgrade to Minecraft 1.18+ or use an older version of this data pack. ","color":"white","bold":false},
        {"text":"(Download for 1.16.2-1.17)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v3.0"}},
        " ",
        {"text":"(Download for 1.16.1 or older)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v2.0"}}
    ]
    scoreboard objectives remove obj.dpData