import ../objectives as obj

def createMethodCheck(objName, id):
    if score @s objName matches 1..
        scoreboard players set $level obj.temp id

def createOreMethod():
    created = []
    for cfg in ctx.meta.config.namespaces.values():
        for name in cfg.ores.keys():
            ore = cfg.ores[name]
            oreTag = ore.get('tag')
            if oreTag: # create the ore tag
                if not oreTag in created:
                    created.append(oreTag)
                id_tag = created.index(oreTag)
                createMethodCheck(obj.ores[name], id_tag)
            else: # ore does not have tag
                created.append(name)
                id = created.index(name)
                createMethodCheck(obj.ores[name], id)

def createLevelMethod():
    # Defauls to 0 (empty hand)
    scoreboard players set $level obj.temp 0
    for cfg in ctx.meta.config.namespaces.values():
        for tool_id in cfg.tools.keys():
            tool = cfg.tools[tool_id]
            if data storage ../temp SelectedItem{id:tool_id}
                scoreboard players set $level obj.temp tool.level


function ./method/ore:
    createOreMethod()

function ./method/level:
    createLevelMethod()