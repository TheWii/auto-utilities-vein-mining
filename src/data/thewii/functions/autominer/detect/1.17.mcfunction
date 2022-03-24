from ../objectives import dpData

scoreboard players set $1.17 dpData 0
execute function ./test/1.17:
    execute if block ~ ~ ~ minecraft:copper_ore
    scoreboard players set $1.17 dpData 1