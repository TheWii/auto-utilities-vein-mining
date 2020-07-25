execute if block ~ ~ ~ #autominer:ores_iron run function autominer:damage/add
execute if score $netherupdate tw.vm.tool matches 1 if block ~ ~ ~ #autominer:iron_netherupdate run function autominer:damage/add
execute if score $mechanization tw.vm.tool matches 1 if block ~ ~ ~ #autominer:ores_mechanization[waterlogged=true,type=double] run function autominer:damage/add

execute unless score $silktouch tw.vm.tool matches 1 run function autominer:xp/detect_version

loot spawn ~ ~ ~ mine ~ ~ ~ mainhand

function autominer:break/setblock

function autominer:damage/calculate

execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~ ~1 ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~ ~-1 ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~1 ~ ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~-1 ~ ~ if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~ ~ ~1 if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron
execute if score $damaged tw.vm.tool < $limit tw.vm.tool positioned ~ ~ ~-1 if block ~ ~ ~ #autominer:ores_iron run function autominer:loop_level/iron

execute if score $netherupdate tw.vm.tool matches 1 run function autominer:loop_level/chains/iron_netherupdate
execute if score $mechanization tw.vm.tool matches 1 run function autominer:loop_level/chains/iron_mechanization