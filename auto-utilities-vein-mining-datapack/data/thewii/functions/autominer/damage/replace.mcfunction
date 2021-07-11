#> thewii:autominer/damage/replace

# Prepare shulker box
setblock ~ 255 ~ yellow_shulker_box

# Set damage
execute store result storage thewii:autominer/temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged twvm.tool

# Test if it needs to be broken
execute unless score @s twvm.safe_break matches 1 run scoreboard players add $durability twvm.tool 1
execute if score $damaged twvm.tool >= $durability twvm.tool run function thewii:autominer/damage/break

# Replace mainhand
execute in minecraft:overworld run data modify block ~ 255 ~ Items append from storage thewii:autominer/temp SelectedItem
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 1 mine ~ 255 ~ minecraft:air{drop_contents:1b}

# Reset shulker box
setblock ~ 255 ~ air