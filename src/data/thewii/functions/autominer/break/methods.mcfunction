import ../objectives as obj

def createMethodCheck(objName, id):
    if score @s objName matches 1..
        scoreboard players set $level obj.temp id

def createOreMethod():
    created = []
    for name in ctx.meta.ores.keys():
        ore = ctx.meta.ores[name]
        oreTag = ore.get('tag')
        if oreTag: # create the ore tag
            if not oreTag in created:
                created.append(oreTag)
            id = created.index(oreTag)
            createMethodCheck(obj.ores[name], id)
        else: # ore does not have tag
            created.append(name)
            id = created.index(name)
            createMethodCheck(obj.ores[name], id)

def createLevelMethod():
    for tool_id in ctx.meta.tools.keys():
        tool = ctx.meta.tools[tool_id]
        if data storage ../temp SelectedItem{id:tool_id}
            scoreboard players set $level obj.temp tool.level


function ./method/ore:
    createOreMethod()

function ./method/level:
    createLevelMethod()