scoreboard objectives add tw.vm.nthr_gold minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add tw.vm.debris minecraft.mined:minecraft.ancient_debris

scoreboard players set $netherupdate tw.vm.tool 1
data merge storage autominer:storage {NetherUpdate:1b}