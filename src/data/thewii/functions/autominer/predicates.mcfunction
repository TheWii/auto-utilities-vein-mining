
from ./objectives import ores

def createMinedPredicate():
    terms = []
    for name in ores.values():
        terms.append({
            "condition": "minecraft:entity_scores",
            "entity": "this",
                "scores": {
                  name: {
                      "min": 1,
                      "max": 2147483647
                }
            }
        })
    predicate ./mined {
        "condition": "minecraft:alternative",
        "terms": terms
    }

###

createMinedPredicate()

predicate ./is_sneaking {
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "flags": {
      "is_sneaking": true
    }
  }
}