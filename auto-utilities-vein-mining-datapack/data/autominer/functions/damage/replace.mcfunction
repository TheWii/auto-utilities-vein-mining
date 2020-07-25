setblock ~ 255 ~ minecraft:yellow_shulker_box{Items:[{id:"minecraft:stone",Count:1b}]}

data modify block ~ 255 ~ Items[0] set from entity @s SelectedItem
execute store result block ~ 255 ~ Items[0].tag.Damage int 1 run scoreboard players get $damaged tw.vm.tool

loot replace entity @s weapon.mainhand 1 mine ~ 255 ~ minecraft:air{drop_contents:1b}

setblock ~ 255 ~ air



