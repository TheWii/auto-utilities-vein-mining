from ../objectives import dpData

scoreboard players set $1.16.2 dpData 0
execute function ./test/1.16.2:
    if entity @e[type=minecraft:piglin_brute]
    scoreboard players set $1.16.2 dpData 1