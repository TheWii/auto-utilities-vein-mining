#> thewii:autominer/post_load

# Check for Mechanization (Not available for 1.17 yet)
execute store success score $mechanization twvm.tool if score $mech.ver load matches 1..
execute if score $1.17 twvm.tool matches 0 if score mechanization twvm.tool matches 1 unless data storage thewii:autominer/data {Mechanization:1b} run function thewii:autominer/install_mechanization