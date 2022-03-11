from ../objectives import math

scoreboard players operation #range math = #max math
scoreboard players operation #range math -= #min math
scoreboard players add #range math 1

scoreboard players operation #lcg math *= #lcg.multiplier math
scoreboard players add #lcg math 1623164762
scoreboard players operation #output math = #lcg math

scoreboard players operation #output math %= #range math
scoreboard players operation #output math += #min math