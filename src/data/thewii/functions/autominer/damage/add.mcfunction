from ../objectives import temp
from ../utils/path import fromRoot

#TODO Use rng and unbreaking formula instead
if score $unbreaking temp matches ..0:
    scoreboard players add $damage temp 1
for lvl in range(1, 4):
    if score $unbreaking temp matches lvl if predicate fromRoot(('unbreaking', lvl))
        run scoreboard players add $damage temp 1

scoreboard players operation $damaged temp = $current_damage temp
scoreboard players operation $damaged temp += $damage temp