scoreboard objectives add tw.vm.tool dummy

scoreboard objectives add tw.vm.coal minecraft.mined:minecraft.coal_ore
scoreboard objectives add tw.vm.iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add tw.vm.gold minecraft.mined:minecraft.gold_ore
scoreboard objectives add tw.vm.lapis minecraft.mined:minecraft.lapis_ore
scoreboard objectives add tw.vm.redstone minecraft.mined:minecraft.redstone_ore
scoreboard objectives add tw.vm.diamond minecraft.mined:minecraft.diamond_ore
scoreboard objectives add tw.vm.emerald minecraft.mined:minecraft.emerald_ore
scoreboard objectives add tw.vm.quartz minecraft.mined:minecraft.nether_quartz_ore

scoreboard objectives add tw.vm.settings trigger
scoreboard players enable @a tw.vm.settings

scoreboard objectives add tw.vm.sneak dummy
scoreboard objectives add tw.vm.particles dummy

execute store success score $mechanization tw.vm.tool run execute if score $mech.ver load matches 1..
execute if score $mechanization tw.vm.tool matches 1 unless data storage autominer:storage {Mechanization:1b} run function autominer:install_mechanization

execute as @a store result score @s tw.vm.tool run data get entity @s DataVersion
execute if entity @a[scores={tw.vm.tool=2513..}] unless score $netherupdate tw.vm.tool matches 1 run function autominer:install_netherupdate
scoreboard players reset @a tw.vm.tool

data merge storage autominer:storage {FirstReload:1b,Version:1.1.4}