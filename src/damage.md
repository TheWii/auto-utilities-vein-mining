
# Damage

## Get

Gets from storage `temp SelectedItem` (mainhand):

- `$custom_dur`: Whether the current tool has custom durability.
- `$current_damage`: A number from 0 up to `$durability` that represents
    the tool damage.
- `$durability`: A number that specifies the maximum value of `$current_damage`.
    When the damage excedes the durability, the tool should break.
- `$unbreaking`: The level of the `minecraft:unbreaking` enchantment (0 if not enchanted).
- `$silk_touch`: Whether the tool has the `minecraft:silk_touch` enchantment (0 if not enchanted).
- `$unbreakable`: Whether the tool is unbreakable (Has `Unbreakable` tag set to true).

```mcfunction
# @function ./damage/get
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

# Detect custom durability
execute store success score $custom_dur {{tempObj}}
    if data storage ../temp SelectedItem.tag.ctc.tool.durability

# Get damage
unless score $custom_dur {{tempObj}} matches 1
    store result score $current_damage {{tempObj}}
    run data get storage ../temp SelectedItem.tag.Damage 
if score $custom_dur {{tempObj}} matches 1
    store result score $current_damage {{tempObj}}
    run data get storage ../temp SelectedItem.tag.ctc.tool.damage 

# Get durability
#!for tool_id, tool in ctx.meta.tools.items()
if data storage ../temp SelectedItem{id:"{{tool_id}}"}:
    scoreboard players set $durability {{tempObj}} {{tool.durability}}
#!endfor
if score $custom_dur {{tempObj}} matches 1
    store result score $durability {{tempObj}}
    run data get storage ../temp SelectedItem.tag.ctc.tool.durability

# Stop vein mining before tool breaks
unless score @s {{pfx~'safe_break'}} matches 1:
    scoreboard players remove $durability {{tempObj}} 1

# Get unbreaking level (0 if not enchanted)
unless data storage ../temp SelectedItem{tag:{Enchantments:[{id:"minecraft:unbreaking"}]}}:
    scoreboard players set $unbreaking {{tempObj}} 0
store result score $unbreaking {{tempObj}}:
    data get storage ../temp SelectedItem.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

# Get unbreakable (tag exists with a non-zero value)
store result score $unbreakable {{tempObj}}:
    data get storage ../temp SelectedItem.tag.Unbreakable
unless score $unbreakable {{tempObj}} matches 0:
    scoreboard players set $unbreakable {{tempObj}} 1

# Get silk touch
if data storage ../temp SelectedItem{tag:{Enchantments:[{id:"minecraft:silk_touch"}]}}
    scoreboard players set $silktouch {{tempObj}} 1
```

## Add

```mcfunction
# @function ./damage/add
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

#TODO Use rng and unbreaking formula instead
if score $unbreaking {{tempObj}} matches ..0:
    scoreboard players add $damage {{tempObj}} 1
#!for lvl in range(1, 4)
if score $unbreaking {{tempObj}} matches {{lvl}} if predicate ./unbreaking/{{lvl}}
    run scoreboard players add $damage {{tempObj}} 1
#!endfor

scoreboard players operation $damaged {{tempObj}} = $current_damage {{tempObj}}
scoreboard players operation $damaged {{tempObj}} += $damage {{tempObj}}
```

## Replace Tool

```mcfunction
# @function ./damage/replace
#!set pfx = ctx.meta.objective_prefix ~ '.'
#!set tempObj = pfx ~ 'temp'

in minecraft:overworld run setblock ~ 255 ~ yellow_shulker_box

# Set damage
execute store result storage ../temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged {{tempObj}}

# Test if it needs to be broken
unless score @s {{pfx~'safe_break'}} matches 1:
    scoreboard players add $durability {{tempObj}} 1
if score $damaged {{tempObj}} >= $durability {{tempObj}} run function ./break

# Replace mainhand
in minecraft:overworld:
    data modify block ~ 255 ~ Items append from storage ../temp SelectedItem
in minecraft:overworld:
    loot replace entity @s weapon.mainhand 1 mine ~ 255 ~ air{drop_contents:1b}

# Reset shulker box
setblock ~ 255 ~ air
```
