# Check for Mechanization
execute store success score $mechanization twvm.tool if score $mech.ver load matches 1..
execute if score mechanization twvm.tool matches 1 unless data storage thewii:autominer/data {Mechanization:1b} run function thewii:autominer/install_mechanization