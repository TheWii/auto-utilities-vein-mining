#> thewii:autominer/tick

execute if score $installed twvm.tool matches 1 as @a[predicate=thewii:autominer/mined] at @s run function thewii:autominer/break/check_sneaking
execute as @a unless score @s AutoVeinMiner matches 0 at @s run function thewii:autominer/settings/triggered