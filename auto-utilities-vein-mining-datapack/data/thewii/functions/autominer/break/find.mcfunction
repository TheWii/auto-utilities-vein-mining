scoreboard players set #found twvm.tool 0
execute anchored eyes positioned ^ ^ ^ run function thewii:autominer/break/raycast

# Detect hand
execute if score #found twvm.tool matches 1 run data modify storage thewii:autominer/temp SelectedItem set from entity @s SelectedItem
execute if score #found twvm.tool matches 1 if data storage thewii:autominer/temp SelectedItem run function thewii:autominer/break/start