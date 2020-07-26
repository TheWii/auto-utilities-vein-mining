scoreboard objectives remove tw.vm.tool

scoreboard objectives remove tw.vm.coal
scoreboard objectives remove tw.vm.iron
scoreboard objectives remove tw.vm.gold
scoreboard objectives remove tw.vm.lapis
scoreboard objectives remove tw.vm.redstone
scoreboard objectives remove tw.vm.diamond
scoreboard objectives remove tw.vm.emerald
scoreboard objectives remove tw.vm.quartz

scoreboard objectives remove tw.vm.tin
scoreboard objectives remove tw.vm.copper
scoreboard objectives remove tw.vm.uranium
scoreboard objectives remove tw.vm.titanium

scoreboard objectives remove tw.vm.nthr.gold
scoreboard objectives remove tw.vm.debris

scoreboard objectives remove tw.vm.settings
scoreboard objectives remove tw.vm.sneak
scoreboard objectives remove tw.vm.particles

data remove storage autominer:storage Version
data remove storage autominer:storage FirstReload
data remove storage autominer:storage Installed
data remove storage autominer:storage NetherUpdate
data remove storage autominer:storage Mechanization

function thewii:autominer/install

tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Datapack]: ","color":"yellow","bold":true},{"text":"Auto Utilities: Vein Mining updated to v","color":"white","bold":false},{"nbt":"Version","storage":"thewii:autominer/data","color":"white","bold":false},{"text":"!","color":"white","bold":false}]