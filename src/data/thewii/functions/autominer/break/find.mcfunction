from ../objectives import temp

scoreboard players set #found temp 0

anchored eyes positioned ^ ^ ^ run function ./raycast:
    # If finds item, then tag it
    if entity @e[type=item,limit=1,sort=nearest,distance=..1,nbt={Age:0s}]
        run function ./tag_item
    # Else step and recurse only if not found item
    unless score #found temp matches 1
        positioned ^ ^ ^0.25
        if entity @s[distance=..7]
        run function ./raycast

if score #found temp matches 1 expand:
    data modify storage ../temp SelectedItem set from entity @s SelectedItem
    store success score $custom_dur temp if data storage ../temp SelectedItem.tag.ctc.tool.durability
    unless score $custom_dur temp matches 1 if data storage ../temp SelectedItem run function ./start