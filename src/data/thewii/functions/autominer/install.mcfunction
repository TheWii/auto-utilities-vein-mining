
import ./objectives as obj

obj.addAll()
scoreboard players enable @a obj.settings

function ./rng/init

scoreboard players set $installed obj.dpData 1
data merge storage ./data {
    FirstReload: 1b,
    Version: ctx.meta.version,
    Installed: 1b
}