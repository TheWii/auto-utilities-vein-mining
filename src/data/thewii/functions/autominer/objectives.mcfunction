
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
for id, cfg in ctx.meta.config.namespaces.items():
    path = generate_path(f"objectives/{id}")
    for name, ore in cfg.ores.items():
        namespace, id = ore.block.split(':')
        criteria = f"minecraft.mined:{namespace}.{id}"
        ores[name] = create(name, criteria, path=path)
    append function ./objectives:
        if score f"$load.{id}" dpData matches 1 run function path