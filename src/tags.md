
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

# Tier tags (Includes the blocks from the current tier
# as well as the ones in the previous tier [hierarchy])
#! for tier_name in ctx.meta.mining_tiers.keys()
block_tag ./tier/{{tier_name}} {
    "values": [
        #!for ore in ctx.meta.ores.values()
        #!if ore.mining_tier == tier_name
        "{{ore.block}}",
        #!endif
        #!endfor
        #!if not loop.first
        "#{{ root ~ 'tier/' ~ loop.previtem }}",
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
