
# Auto Utilities: Vein Mining

## Tick

```mcfunction
# @function tick
#! tag "minecraft:tick"
#! set root = generate_path('')

if score $installed twvm.tool matches 1 expand:
    as @a[predicate={{ root~'mined' }}] at @s run function ./break/check_sneaking
    as @a unless score @s AutoVeinMiner matches 0 at @s run function ./settings/triggered
```

## Load

```mcfunction
# @function load
#!tag "minecraft:load"

#!set prefix = ctx.meta.objective_prefix ~ '.'
#!set dataObj = prefix ~ 'data'

scoreboard objectives add {{dataObj}} dummy
scoreboard players set $installed {{dataObj}} 0

function ./detect/1.18

#TODO Use proper json component parsing
#TODO Use lantern load plugin
if score $1.18 {{dataObj}} matches 1 run function ./load_2:
   #scoreboard players set ${{prefix ~ 'version'}} load 040000
   function ./install
   schedule function ./post_load 1t
   tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
       {"text":"[Datapack]: ","color":"yellow","bold":true},
       {"text":"Auto Utilities: Vein Mining v","color":"white","bold":false},
       {"nbt":"Version","storage":"thewii:autominer/data","color":"white","bold":false},
       {"text":" is loaded!!!!","color":"white","bold":false}
    ]

if score $1.18 {{dataObj}} matches 0 expand:
    tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [
        {"text":"[Datapack]: ","color":"red","bold":true},
        {"text":"Auto Utilities: Vein Mining v4.0 failed to be loaded. Either upgrade to Minecraft 1.18+ or use an older version of this data pack. ","color":"white","bold":false},
        {"text":"(Download for 1.16.2-1.17)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v3.0"}},
        " ",
        {"text":"(Download for 1.16.1 or older)","color":"gray","underlined":true,"bold":false,"clickEvent":{"action":"open_url","value":"https://github.com/TheWii/auto-utilities-vein-mining/releases/tag/v2.0"}}
    ]
    scoreboard objectives remove {{dataObj}}
```

## Installation

The objectives are generated from the specified ores in `meta.ores`.

```mcfunction
# @function install
#!set prefix = ctx.meta.objective_prefix ~ '.'

#!for name, ore in ctx.meta.ores.items()
    #!set namespace, id = ore.block.split(':')
    scoreboard objectives add {{prefix ~ name}} minecraft.mined:{{namespace}}.{{id}}
#!endfor

scoreboard objectives add AutoVeinMiner trigger
scoreboard players enable @a AutoVeinMiner

scoreboard objectives add {{ prefix~'temp' }} dummy
scoreboard objectives add {{ prefix~'tool' }} dummy
scoreboard objectives add {{ prefix~'sneak' }} dummy
scoreboard objectives add {{ prefix~'particles' }} dummy
scoreboard objectives add {{ prefix~'deactivated' }} dummy
scoreboard objectives add {{ prefix~'method' }} dummy
scoreboard objectives add {{ prefix~'dropitems' }} dummy
scoreboard objectives add {{ prefix~'safe_break' }} dummy

function ./rng/init

scoreboard players set $installed twvm.tool 1
data merge storage ./data {
    FirstReload: 1b,
    Version: "{{ctx.meta.version}}",
    Installed: 1b
}
```

## Mined Predicate

Checks if player has mined any of the ores specified in `meta.ores`
(positive score in any of the ore objectives).

```json
# @predicate mined
#!set prefix = ctx.meta.objective_prefix ~ '.'
{
    "condition": "minecraft:alternative",
    "terms": [
        #!for name, _ in ctx.meta.ores.items()
        {
            "condition": "minecraft:entity_scores",
            "entity": "this",
            "scores": {
                "{{prefix ~ name}}": {
                    "min": 1,
                    "max": 2147483647
                }
            }
        }{% if not loop.last %},{% endif %}
        #!endfor
    ]
}
```

```json
# @predicate ./is_sneaking
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "flags": {
      "is_sneaking": true
    }
  }
}
```
