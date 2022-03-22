import ./objectives as obj
from ./utils/path import fromRoot, getPath

merge function_tag minecraft:tick {
    "values": [ getPath() ]
}

if score $installed obj.dpData matches 1 expand:
    as @a[predicate=fromRoot('mined')] at @s run function ./break/check_sneaking
    as @a unless score @s obj.settings matches 0 at @s run function ./settings/triggered