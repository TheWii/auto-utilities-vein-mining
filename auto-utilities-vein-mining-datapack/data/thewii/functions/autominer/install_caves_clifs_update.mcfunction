#> thewii:autominer/install_caves_clifs_update

scoreboard objectives add twvm.copper minecraft.mined:minecraft.copper_ore
scoreboard objectives add twvm.dcopper minecraft.mined:minecraft.deepslate_copper_ore
scoreboard objectives add twvm.diron minecraft.mined:minecraft.deepslate_iron_ore
scoreboard objectives add twvm.dgold minecraft.mined:minecraft.deepslate_gold_ore
scoreboard objectives add twvm.dredstone minecraft.mined:minecraft.deepslate_redstone_ore
scoreboard objectives add twvm.demerald minecraft.mined:minecraft.deepslate_emerald_ore
scoreboard objectives add twvm.dcoal minecraft.mined:minecraft.deepslate_coal_ore
scoreboard objectives add twvm.dlapis minecraft.mined:minecraft.deepslate_lapis_ore
scoreboard objectives add twvm.ddiamond minecraft.mined:minecraft.deepslate_diamond_ore

data merge storage thewii:autominer/data {CAndCUpdate:1b}