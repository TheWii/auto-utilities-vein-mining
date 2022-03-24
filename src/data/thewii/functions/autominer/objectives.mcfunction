
prefix = ctx.meta.prefix + '.'
criterias = {}

def create(name, criteria='dummy', isPrefixed=True, path=./objectives):
    if isPrefixed:
        name = prefix + name
    criterias[name] = criteria
    append function path:
        scoreboard objectives add name criteria
    return name

def addAll():
    function ./objectives

def addSingle(name):
    scoreboard objectives add name criterias[name]

# Main Objectives
settings = create('AutoVeinMiner', 'trigger', False)
dpData = create('data')
temp = create('temp')
math = create('math')
tool = create('tool')
sneak = create('sneak')
particles = create('particles')
deactivated = create('deactivated')
method = create('method')
dropItems = create('dropitems')
safeBreak = create('safe_break')

# Ore Objectives
ores = {}
for id in ctx.meta.config.namespaces.keys():
    cfg = ctx.meta.config.namespaces[id]
    path = generate_path(f"objectives/{id}")
    for name in cfg.ores.keys():
        ore = cfg.ores[name]
        resource = ore.block.split(':')
        criteria = f"minecraft.mined:{resource[0]}.{resource[1]}"
        ores[name] = create(name, criteria, path=path)
    append function ./objectives:
        if score f"$load.{id}" dpData matches 1 run function path