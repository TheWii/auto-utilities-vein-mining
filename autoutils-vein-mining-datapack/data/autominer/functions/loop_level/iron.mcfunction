scoreboard players add $length twvm.tool 1

execute if block ~ ~ ~ #autominer:ores_iron run function autominer:damage/add
execute if score $netherupdate twvm.tool matches 1 if block ~ ~ ~ #autominer:iron_netherupdate run function autominer:damage/add
execute if score $mechanization twvm.tool matches 1 if block ~ ~ ~ #autominer:ores_mechanization[waterlogged=true,type=double] run function autominer:damage/add

execute unless score $silktouch twvm.tool matches 1 run function autominer:xp/detect_version

loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

setblock ~ ~ ~ air

execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~1 ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~-1 ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~1 ~ ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~-1 ~ ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~ ~1 if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute unless score $length twvm.tool matches 256.. if score $damaged twvm.tool < $limit twvm.tool positioned ~ ~ ~-1 if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron

execute if score $netherupdate twvm.tool matches 1 run function autominer:loop_level/chains/iron_netherupdate
execute if score $mechanization twvm.tool matches 1 run function autominer:loop_level/chains/iron_mechanization