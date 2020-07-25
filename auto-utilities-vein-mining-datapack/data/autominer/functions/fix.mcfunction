tag @s[type=player] add tw.vm.fixing

function autominer:uninstall
function autominer:install

execute store success score mechanization tw.vm.tool run execute if score $mech.ver load matches 1..
execute if score mechanization tw.vm.tool matches 1 unless data storage autominer:storage {Mechanization:1b} run function autominer:install_mechanization

execute as @a store result score @s tw.vm.tool run data get entity @s DataVersion
execute if entity @a[scores={tw.vm.tool=2513..}] run function autominer:install_netherupdate
scoreboard players reset @a tw.vm.tool

tag @s remove tw.vm.fixing

tellraw @a ["",{"text":"[Datapack] ","color":"white"},{"text":"Auto Utilities: Vein Mining v1.1.4 was reinstalled! If you're still having problems, download the datapack again from the website. If problems persist, please contact me.","color":"yellow"}]