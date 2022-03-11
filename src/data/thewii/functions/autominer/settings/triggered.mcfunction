import ../objectives as obj
from ../utils/path import relative

# Generate setting field triggers
fields = {
    'deactivated': {
        'options': 2,
        'objective': obj.deactivated
    },
    'method': {
        'options': 2,
        'objective': obj.method
    },
    'sneak': {
        'options': 3,
        'objective': obj.sneak
    },
    'particles': {
        'options': 2,
        'objective': obj.particles
    },
    'dropitems': {
        'options': 2,
        'objective': obj.dropItems
    },
    'safe_break': {
        'options': 2,
        'objective': obj.safeBreak
    }
}

for name in fields.keys():
    field = fields[name]
    function relative(('field', name)):
        scoreboard players add @s field['objective'] 1
        scoreboard players operation @s field['objective'] %= f"#{field['options']}" obj.math
        function ./show

if score @s obj.settings matches 1 run function ./show
id = 2
for name in fields.keys():
    if score @s obj.settings matches id run function relative(('field', name))
    id += 1
    
scoreboard players reset @s obj.settings
scoreboard players enable @s obj.settings