
import ./objectives as obj

obj.addAll()
scoreboard players enable @a obj.settings

function ./rng/init

for i, name in enumerate(["major", "minor", "patch"]):
    scoreboard players set f"#{generate_id(name)}" load.status ctx.meta.version[i]

scoreboard players set $installed obj.dpData 1
data merge storage ./data {
    FirstReload: 1b,
    Version: (".".join(map(str, ctx.meta.version))),
    Installed: 1b
}