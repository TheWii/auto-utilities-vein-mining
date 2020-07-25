execute store result score @s tw.vm.tool run data get entity @s SelectedItem.tag.Damage

execute if data entity @s {SelectedItem:{id:"minecraft:wooden_pickaxe"}} run scoreboard players set $limit tw.vm.tool 59
execute if data entity @s {SelectedItem:{id:"minecraft:stone_pickaxe"}} run scoreboard players set $limit tw.vm.tool 131
execute if data entity @s {SelectedItem:{id:"minecraft:golden_pickaxe"}} run scoreboard players set $limit tw.vm.tool 32
execute if data entity @s {SelectedItem:{id:"minecraft:iron_pickaxe"}} run scoreboard players set $limit tw.vm.tool 250
execute if data entity @s {SelectedItem:{id:"minecraft:diamond_pickaxe"}} run scoreboard players set $limit tw.vm.tool 1561
execute if data entity @s {SelectedItem:{id:"minecraft:netherite_pickaxe"}} run scoreboard players set $limit tw.vm.tool 2031


execute unless data entity @s {SelectedItem:{tag:{Enchantments:[{id:"minecraft:unbreaking"}]}}} run scoreboard players set $unbreaking tw.vm.tool 0
execute if data entity @s {SelectedItem:{tag:{Enchantments:[{lvl:1s,id:"minecraft:unbreaking"}]}}} run scoreboard players set $unbreaking tw.vm.tool 1
execute if data entity @s {SelectedItem:{tag:{Enchantments:[{lvl:2s,id:"minecraft:unbreaking"}]}}} run scoreboard players set $unbreaking tw.vm.tool 2
execute if data entity @s {SelectedItem:{tag:{Enchantments:[{lvl:3s,id:"minecraft:unbreaking"}]}}} run scoreboard players set $unbreaking tw.vm.tool 3
execute if data entity @s {SelectedItem:{tag:{Unbreakable:1}}} run scoreboard players set $unbreaking tw.vm.tool -1
execute if data entity @s {SelectedItem:{tag:{Enchantments:[{id:"minecraft:silk_touch"}]}}} run scoreboard players set $silktouch tw.vm.tool 1