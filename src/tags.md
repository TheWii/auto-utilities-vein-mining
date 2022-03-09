
# Tags

## Method Tags

```mcfunction
# @function tags
#!set root = generate_path('')

# Ore tags (groups ores with the same "tag" field)
#! for tag_name in ctx.meta.tags
block_tag ./ore/{{tag_name}} {
    "values": [
        #!for ore in ctx.meta.ores.values()
        #!if ore.tag == tag_name
        "{{ore.block}}",
        #!endif
        #!endfor
    ]
}
#!endfor

# Mining level tags (Includes the blocks from the current level
# as well as the ones in the previous level [hierarchy])
#! for level in ctx.meta.mining_levels
block_tag ./level/{{level}} {
    "values": [
        #!for ore in ctx.meta.ores.values()
        #!if ore.mining_level == level
        "{{ore.block}}",
        #!endif
        #!endfor
        #!if not loop.first
        "#{{ root ~ 'level/' ~ loop.previtem }}",
        #!endif
    ]
}
#!endfor

# A tag that includes all ores that contains a valid "xp" field
block_tag ./xp_ores {
    "values": [
        #!for ore in ctx.meta.ores.values()
        #!if ore.xp and ore.xp != 0
        "{{ore.block}}",
        #!endif
        #!endfor
    ]
}

```
