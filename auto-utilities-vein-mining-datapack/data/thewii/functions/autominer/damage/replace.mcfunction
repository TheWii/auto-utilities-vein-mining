# Reset shulker box
execute in minecraft:overworld run data modify block 29999983 0 4320 Items set value [{Slot:0b,id:"minecraft:stone",Count:1b}]

# Set damage
execute store result storage thewii:autominer/temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged twvm.tool

# Replace mainhand
execute in minecraft:overworld run data modify block 29999983 0 4320 Items[0] set from storage thewii:autominer/temp SelectedItem
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 1 mine 29999983 0 4320 minecraft:air{drop_contents:1b}


