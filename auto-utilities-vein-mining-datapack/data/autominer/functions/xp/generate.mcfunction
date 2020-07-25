function autominer:xp/random

execute if block ~ ~ ~ minecraft:coal_ore run function autominer:xp/coal
execute if block ~ ~ ~ minecraft:nether_quartz_ore run function autominer:xp/lapis
execute if block ~ ~ ~ minecraft:lapis_ore run function autominer:xp/lapis
execute if block ~ ~ ~ minecraft:redstone_ore run function autominer:xp/redstone
execute if block ~ ~ ~ minecraft:diamond_ore run function autominer:xp/diamond
execute if block ~ ~ ~ minecraft:emerald_ore run function autominer:xp/diamond

execute if score $netherupdate tw.vm.tool matches 1 run function autominer:xp/generate_netherupdate

scoreboard players reset $rng tw.vm.tool