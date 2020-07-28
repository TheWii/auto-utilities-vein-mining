# Reset shulker box
execute in minecraft:overworld run data remove block 29999983 0 4320 Items

# Set damage
execute unless score $custom_dur twvm.tool matches 1 store result storage thewii:autominer/temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged twvm.tool
execute if score $custom_dur twvm.tool matches 1 store result storage thewii:autominer/temp SelectedItem.tag.ctc.tool.damage int 1 run scoreboard players get $damaged twvm.tool

# If it isn't a custom tool test if it needs to be broken
execute unless score @s twvm.safe_break matches 1 run scoreboard players add $durability twvm.tool 1
execute unless score $custom_dur twvm.tool matches 1 if score $damaged twvm.tool >= $durability twvm.tool run function thewii:autominer/damage/break

# Move to global temporary storage
data modify storage global:temp item set from storage thewii:autominer/temp SelectedItem

# Call custom tool validation function if it's a custom tool
execute if score $custom_dur twvm.tool matches 1 run tellraw @s[tag=player.debug] ["- Vein miner calculated +",{"score":{"name":"$damage","objective":"twvm.tool"}}," damage. Calling global validation tag"]
execute if score $custom_dur twvm.tool matches 1 run function #global:global_durability/validate

# Replace mainhand
execute in minecraft:overworld run data modify block 29999983 0 4320 Items append from storage global:temp item
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 1 mine 29999983 0 4320 minecraft:air{drop_contents:1b}

# Clear global temporary storage
data remove storage global:temp item


