scoreboard objectives add twvp.data dummy
scoreboard objectives add twvp.temp dummy

function thewii:vp_library/core/get_versions
scoreboard players operation $1.15 twvp.data = $1.15 twvp.temp
scoreboard players operation $1.16 twvp.data = $1.16 twvp.temp