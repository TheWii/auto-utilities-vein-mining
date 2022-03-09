
# Detect

Detect specific Minecraft versions.

```mcfunction
# @function ./detect/1.18

#!set prefix = ctx.meta.objective_prefix ~ '.'
#!set dataObj = prefix ~ 'data'

scoreboard players set $1.18 {{dataObj}} 0
# define and call test
function ./test/1.18
function ./test/1.18:
    scoreboard objectives add twvm.looooooooooooooooooooooooooooooooooooong_name dummy
    scoreboard objectives remove twvm.looooooooooooooooooooooooooooooooooooong_name
    scoreboard players set $1.18 {{dataObj}} 1
```
