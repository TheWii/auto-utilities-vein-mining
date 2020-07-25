execute if score $unbreaking twvm.tool matches ..0 run scoreboard players add $damage twvm.tool 1
execute if score $unbreaking twvm.tool matches 1 if predicate autominer:unbreaking_1 run scoreboard players add $damage twvm.tool 1
execute if score $unbreaking twvm.tool matches 2 if predicate autominer:unbreaking_2 run scoreboard players add $damage twvm.tool 1
execute if score $unbreaking twvm.tool matches 3.. if predicate autominer:unbreaking_3 run scoreboard players add $damage twvm.tool 1

scoreboard players operation $damaged twvm.tool = @s twvm.tool
scoreboard players operation $damaged twvm.tool += $damage twvm.tool