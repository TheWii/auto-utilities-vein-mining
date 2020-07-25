execute unless data storage autominer:storage {FirstReload:1b} run function autominer:install

execute unless data storage autominer:storage {Version:1.1.4} run function autominer:update

execute store success score $mechanization tw.vm.tool run execute if score $mech.ver load matches 1..
execute if score $mechanization tw.vm.tool matches 1 unless data storage autominer:storage {Mechanization:1b} run function autominer:install_mechanization

execute as @a store result score @s tw.vm.tool run data get entity @s DataVersion
execute if entity @a[scores={tw.vm.tool=2513..}] unless score $netherupdate tw.vm.tool matches 1 run function autominer:install_netherupdate
scoreboard players reset @a tw.vm.tool

execute if score $mechanization tw.vm.tool matches 0 run tellraw @a ["",{"text":"[Datapack] ","color":"white"},{"text":"Auto Utilities: Vein Mining v1.1.4 is loaded! ","color":"green"}]
execute if score $mechanization tw.vm.tool matches 1 run tellraw @a ["",{"text":"[Datapack] ","color":"white"},{"text":"Auto Utilities: Vein Mining v1.1.4 is loaded with Mechanization integration!","color":"green"}]

scoreboard players enable @a tw.vm.settings