
prefix = ctx.meta.prefix + '.'
criterias = {}

def create(name, criteria='dummy', isPrefixed=True):
    if isPrefixed:
        name = prefix + name
    criterias[name] = criteria
    append function ./objectives:
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
for name in ctx.meta.ores.keys():
    ore = ctx.meta.ores[name]
    resource = ore.block.split(':')
    criteria = f"minecraft.mined:{resource[0]}.{resource[1]}"
    ores[name] = create(name, criteria)