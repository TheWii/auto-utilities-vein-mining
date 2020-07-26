# Reset shulker box
execute in minecraft:overworld run data modify block 29999983 0 4320 Items set value [{Slot:0b,id:"minecraft:stone",Count:1b}]

# Set damage
execute unless score $custom_dur twvm.tool matches 1 store result storage thewii:autominer/temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged twvm.tool
execute if score $custom_dur twvm.tool matches 1 store result storage thewii:autominer/temp SelectedItem.tag.ctc.tool.damage int 1 run scoreboard players get $damaged twvm.tool

# Break tool
scoreboard players add $durability twvm.tool 1
execute if score $damaged twvm.tool >= $durability twvm.tool run function thewii:autominer/damage/break

# Replace mainhand
execute in minecraft:overworld run data modify block 29999983 0 4320 Items[0] set from storage thewii:autominer/temp SelectedItem
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 1 mine 29999983 0 4320 minecraft:air{drop_contents:1b}


