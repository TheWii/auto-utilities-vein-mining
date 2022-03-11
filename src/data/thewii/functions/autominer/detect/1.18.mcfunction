from ../objectives import dpData

scoreboard players set $1.18 dpData 0
execute function ./test/1.18:
    scoreboard objectives add twvm.looooooooooooooooooooooooooooooooooooong_name dummy
    scoreboard objectives remove twvm.looooooooooooooooooooooooooooooooooooong_name
    scoreboard players set $1.18 dpData 1