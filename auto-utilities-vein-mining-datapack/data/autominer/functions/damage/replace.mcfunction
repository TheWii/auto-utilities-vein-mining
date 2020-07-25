data modify block 29999983 0 4320 Items set value [{Slot:0b,id:"minecraft:stone",Count:1b}]

data modify block 29999983 0 4320 Items[0] set from entity @s SelectedItem
execute store result block 29999983 0 4320 Items[0].tag.Damage int 1 run scoreboard players get $damaged twvm.tool

loot replace entity @s weapon.mainhand 1 mine 29999983 0 4320 minecraft:air{drop_contents:1b}



