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
    for cfg in ctx.meta.config.namespaces.values():
        for name in cfg.ores.keys():
            ore = cfg.ores[name]
            oreTag = ore.get('tag')
            if oreTag and not oreTag in created: # create the ore tag
                resolvedTag = '#' + path.fromRoot(('ore', oreTag))
                create(oreTag, resolvedTag)
            if not oreTag: # ore does not have tag
                create(name, ore.block)

def createLevelMethodStep():
    for level in ctx.meta.config.mining_levels:
        levelTag = '#' + path.fromRoot(('level', level))
        functionPath = path.relative(('level', level))
        createStepFunction(functionPath, levelTag)
        id = ctx.meta.config.mining_levels.index(level)
        createStepCheck(id, functionPath)
    
# Ore tags (groups ores with the same "tag" field)
def createOreTags():
    for tag_name in ctx.meta.config.tags:
        values = []
        for cfg in ctx.meta.config.namespaces.values():
            for ore in cfg.ores.values():
                if not ore.get('tag'):
                    continue
                if ore.tag == tag_name:
                    values.append({"id": ore.block, "required": false})
        block_tag path.fromRoot(('ore', tag_name)) {
            "values": values
        }

# Mining level tags (Includes the blocks from the current level
# as well as the ones in the previous level [hierarchy])
def createLevelTags():
    previous = None
    for level in ctx.meta.config.mining_levels:
        values = []
        for namespace_id in ctx.meta.config.namespaces.keys():
            cfg = ctx.meta.config.namespaces[namespace_id]
            ores = []
            for ore in cfg.ores.values():
                if ore.mining_level == level:
                    ores.append(ore.block)
            tag_path = generate_path(f"level/{namespace_id}/{level}")
            block_tag tag_path { "values": ores }
            values.append({ "id": f"#{tag_path}", "required": false })
        if previous != None:
            previousTag = '#' + generate_path(f"level/{previous}")
            values.append(previousTag)
        previous = level
        block_tag generate_path(f"level/{level}") {
            "values": values
        }

###

function ./ore:
    createOreMethodStep()

function ./level:
    createLevelMethodStep()

createOreTags()
createLevelTags()