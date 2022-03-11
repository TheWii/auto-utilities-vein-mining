from ../objectives import dropItems, temp

xpTag = ctx.meta.prefix + '.tag'

if score @s dropItems matches 1 at @s:
    summon experience_orb ~ ~ ~ {Tags:[xpTag]}
unless score @s dropItems matches 1:
    summon experience_orb ~ ~ ~ {Tags:[xpTag]}

store result entity @e[type=experience_orb,limit=1,tag=xpTag] Value short 1:
    scoreboard players get $xp temp

tag @e[type=experience_orb,tag=xpTag,limit=1] remove xpTag