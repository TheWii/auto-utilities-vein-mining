execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 1
execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 2
execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 4
execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 8
execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 16
execute if predicate thewii:autominer/bit run scoreboard players add $rng twvm.tool 32

execute if block ~ ~ ~ minecraft:coal_ore run function thewii:autominer/xp/coal
execute if block ~ ~ ~ minecraft:deepslate_coal_ore run function thewii:autominer/xp/coal

execute if block ~ ~ ~ minecraft:deepslate_lapis_ore run function thewii:autominer/xp/lapis
execute if block ~ ~ ~ minecraft:lapis_ore run function thewii:autominer/xp/lapis

execute if block ~ ~ ~ minecraft:redstone_ore run function thewii:autominer/xp/redstone
execute if block ~ ~ ~ minecraft:deepslate_redstone_ore run function thewii:autominer/xp/redstone

execute if block ~ ~ ~ minecraft:diamond_ore run function thewii:autominer/xp/diamond
execute if block ~ ~ ~ minecraft:deepslate_diamond_ore run function thewii:autominer/xp/diamond

execute if block ~ ~ ~ minecraft:deepslate_emerald_ore run function thewii:autominer/xp/diamond
execute if block ~ ~ ~ minecraft:emerald_ore run function thewii:autominer/xp/diamond

execute if block ~ ~ ~ #thewii:autominer/nether_gold_ore run function thewii:autominer/xp/nether_gold
execute if block ~ ~ ~ minecraft:nether_quartz_ore run function thewii:autominer/xp/lapis

scoreboard players reset $rng twvm.tool