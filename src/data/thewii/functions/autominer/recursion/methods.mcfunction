from mecha.contrib.bolt import Runtime
import ../utils/path as path
import ../utils/pos as position
import ../objectives as obj

runtime = ctx.inject(Runtime)
thisPath = runtime.get_path()

# Generate command offset in a 3x3 grid
def createStepFunction(functionPath, blockId):
    function functionPath:
        for pos in position.offsetGrid(-1, 1):
            if not any(pos): # Skip ~ ~ ~
                continue
            unless score $length obj.temp matches 256..
                unless score $damaged obj.temp >= $durability obj.temp
                positioned f"~{pos[0]} ~{pos[1]} ~{pos[2]}"
                if block ~ ~ ~ blockId
                run function ./recurse


def createStepCheck(id, functionPath):
    if score $level obj.temp matches id
        run function functionPath

def createOreMethodStep():
    created = []
    def create(name, blockCheck):
        created.append(name)
        id = created.index(name)
        functionPath = path.relative(('ore', name))
        createStepFunction(functionPath, blockCheck)
        createStepCheck(id, functionPath)
    for name in ctx.meta.ores.keys():
        ore = ctx.meta.ores[name]
        oreTag = ore.get('tag')
        if oreTag and not oreTag in created: # create the ore tag
            resolvedTag = '#' + path.fromRoot(('ore', oreTag))
            create(oreTag, resolvedTag)
        if not oreTag: # ore does not have tag
            create(name, ore.block)

def createLevelMethodStep():
    for level in ctx.meta.mining_levels:
        levelTag = '#' + path.fromRoot(('level', level))
        functionPath = path.relative(('level', level))
        createStepFunction(functionPath, levelTag)
        id = ctx.meta.mining_levels.index(level)
        createStepCheck(id, functionPath)
    
# Ore tags (groups ores with the same "tag" field)
def createOreTags():
    for tag_name in ctx.meta.tags:
        values = []
        for ore in ctx.meta.ores.values():
            if not ore.get('tag'):
                continue
            if ore.tag == tag_name:
                values.append(ore.block)
        block_tag path.fromRoot(('ore', tag_name)) {
            "values": values
        }

# Mining level tags (Includes the blocks from the current level
# as well as the ones in the previous level [hierarchy])
def createLevelTags():
    previous = None
    for level in ctx.meta.mining_levels:
        values = []
        for ore in ctx.meta.ores.values():
            if ore.mining_level == level:
                values.append(ore.block)
        if previous != None:
            previousTag = '#' + path.fromRoot(('level', previous))
            values.append(previousTag)
        previous = level
        block_tag path.fromRoot(('level', level)) {
            "values": values
        }

###

function ./ore:
    createOreMethodStep()

function ./level:
    createLevelMethodStep()

createOreTags()
createLevelTags()