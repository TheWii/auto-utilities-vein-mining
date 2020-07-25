execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 1
execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 2
execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 4
execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 8
execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 16
execute if predicate autominer:bit run scoreboard players add $rng twvm.tool 32

execute if block ~ ~ ~ minecraft:coal_ore run function autominer:xp/coal
execute if block ~ ~ ~ minecraft:nether_quartz_ore run function autominer:xp/lapis
execute if block ~ ~ ~ minecraft:lapis_ore run function autominer:xp/lapis
execute if block ~ ~ ~ minecraft:redstone_ore run function autominer:xp/redstone
execute if block ~ ~ ~ minecraft:diamond_ore run function autominer:xp/diamond
execute if block ~ ~ ~ minecraft:emerald_ore run function autominer:xp/diamond

execute if score $netherupdate twvm.tool matches 1 run function autominer:xp/generate_netherupdate

scoreboard players reset $rng twvm.tool