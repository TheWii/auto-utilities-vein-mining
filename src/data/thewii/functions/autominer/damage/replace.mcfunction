from ../objectives import temp, safeBreak

setblock ~ 255 ~ yellow_shulker_box

# Set damage
execute store result storage ../temp SelectedItem.tag.Damage int 1 run scoreboard players get $damaged temp

# Test if it needs to be broken
unless score @s safeBreak matches 1:
    scoreboard players add $durability temp 1
if score $damaged temp >= $durability temp run function ./break

# Replace mainhand
data modify block ~ 255 ~ Items append from storage ../temp SelectedItem
loot replace entity @s weapon.mainhand 1 mine ~ 255 ~ air{drop_contents:1b}

# Reset shulker box
setblock ~ 255 ~ air