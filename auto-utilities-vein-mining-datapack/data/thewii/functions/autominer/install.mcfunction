#> thewii:autominer/install

# Objectives
scoreboard objectives add twvm.tool dummy

scoreboard objectives add twvm.coal minecraft.mined:minecraft.coal_ore
scoreboard objectives add twvm.iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add twvm.gold minecraft.mined:minecraft.gold_ore
scoreboard objectives add twvm.lapis minecraft.mined:minecraft.lapis_ore
scoreboard objectives add twvm.redstone minecraft.mined:minecraft.redstone_ore
scoreboard objectives add twvm.diamond minecraft.mined:minecraft.diamond_ore
scoreboard objectives add twvm.emerald minecraft.mined:minecraft.emerald_ore
scoreboard objectives add twvm.quartz minecraft.mined:minecraft.nether_quartz_ore

scoreboard objectives add twvm.nthr_gold minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add twvm.debris minecraft.mined:minecraft.ancient_debris
scoreboard objectives add twvm.gilded minecraft.mined:minecraft.gilded_blackstone

scoreboard objectives add AutoVeinMiner trigger
scoreboard players enable @a AutoVeinMiner

scoreboard objectives add twvm.sneak dummy
scoreboard objectives add twvm.particles dummy
scoreboard objectives add twvm.deactivated dummy
scoreboard objectives add twvm.method dummy
scoreboard objectives add twvm.dropitems dummy
scoreboard objectives add twvm.safe_break dummy



# Check For 1.17
scoreboard players set $1.17 twvm.tool 0
function thewii:autominer/detect_1.17
execute if score $1.17 twvm.tool matches 1 run function thewii:autominer/install_caves_clifs_update

# Post load
schedule function thewii:autominer/post_load 1t

scoreboard players set $installed twvm.tool 1
data merge storage thewii:autominer/data {FirstReload:1b, Version:"2.1", Installed:1b}