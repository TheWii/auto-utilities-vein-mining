#> thewii:autominer/break/find

scoreboard players set #found twvm.tool 0
execute anchored eyes positioned ^ ^ ^ run function thewii:autominer/break/raycast
#execute as @e[type=item,tag=twvm.ore] at @s run particle flame ~ ~ ~ 0.1 0.1 0.1 0.2 50 normal

# If item in hand, not custom tool, then continue, else break.
execute if score #found twvm.tool matches 1 run data modify storage thewii:autominer/temp SelectedItem set from entity @s SelectedItem
execute if score #found twvm.tool matches 1 store success score $custom_dur twvm.tool if data storage thewii:autominer/temp SelectedItem.tag.ctc.tool.durability
execute if score #found twvm.tool matches 1 if data storage thewii:autominer/temp SelectedItem unless score $custom_dur twvm.tool matches 1 run function thewii:autominer/break/start