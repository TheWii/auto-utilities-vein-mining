# Check sneaking
execute unless score @s twvm.sneak matches 0..2 run scoreboard players set @s twvm.sneak 0
execute unless score @s twvm.deactivated matches 1.. if entity @s[tag=!global.ignore] if score @s twvm.sneak matches 0 unless predicate thewii:autominer/is_sneaking run function thewii:autominer/break/find
execute unless score @s twvm.deactivated matches 1.. if entity @s[tag=!global.ignore] if score @s twvm.sneak matches 1 if predicate thewii:autominer/is_sneaking run function thewii:autominer/break/find
execute unless score @s twvm.deactivated matches 1.. if entity @s[tag=!global.ignore] if score @s twvm.sneak matches 2 run function thewii:autominer/break/find

# Reset scores
scoreboard players reset @s twvm.coal
scoreboard players reset @s twvm.iron
scoreboard players reset @s twvm.gold
scoreboard players reset @s twvm.lapis
scoreboard players reset @s twvm.redstone
scoreboard players reset @s twvm.diamond
scoreboard players reset @s twvm.emerald
scoreboard players reset @s twvm.quartz

scoreboard players reset @s twvm.nthr_gold
scoreboard players reset @s twvm.debris

scoreboard players reset @s twvm.tin
scoreboard players reset @s twvm.copper
scoreboard players reset @s twvm.uranium
scoreboard players reset @s twvm.titanium

scoreboard players reset $custom_dur twvm.tool
scoreboard players reset $keep_broken twvm.tool
scoreboard players reset $xp twvm.tool
scoreboard players reset $current_damage twvm.tool
scoreboard players reset $damage twvm.tool
scoreboard players reset $damaged twvm.tool
scoreboard players reset $unbreaking twvm.tool
scoreboard players reset $unbreakable twvm.tool
scoreboard players reset $silktouch twvm.tool
scoreboard players reset $durability twvm.tool
scoreboard players reset $level twvm.tool
scoreboard players reset $length twvm.tool