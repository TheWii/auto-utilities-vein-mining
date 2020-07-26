scoreboard players add $length twvm.tool 1

execute if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/damage/add
execute if score $netherupdate twvm.tool matches 1 if block ~ ~ ~ #thewii:autominer/stone_netherupdate run function thewii:autominer/damage/add
execute if score $mechanization twvm.tool matches 1 if block ~ ~ ~ #thewii:autominer/ores_mechanization[waterlogged=true,type=double] run function thewii:autominer/damage/add

execute unless score $silktouch twvm.tool matches 1 run function thewii:autominer/xp/detect_version

loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

setblock ~ ~ ~ air

execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~1 ~ if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~-1 ~ if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~1 ~ ~ if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~-1 ~ ~ if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~ ~1 if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~ ~-1 if block ~ ~ ~ #thewii:autominer/ores_stone run function thewii:autominer/loop_level/stone

execute if score $netherupdate twvm.tool matches 1 run function thewii:autominer/loop_level/chains/stone_netherupdate
execute if score $mechanization twvm.tool matches 1 run function thewii:autominer/loop_level/chains/stone_mechanization