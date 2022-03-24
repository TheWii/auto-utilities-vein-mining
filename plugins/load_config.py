import json
from dataclasses import dataclass
from typing import List, cast
from attr import dataclass
from pydantic import BaseModel

from beet import Context, Predicate, configurable
from beet.core.utils import JsonDict
from mecha.contrib.bolt import Runtime

DEFAULT_MATCH = [ "config/**/*.json" ]

@dataclass
class Config:
    content: JsonDict

    def __getitem__(self, key: str):
        return self.content[key]

    def __setitem__(self, key: str, value: any):
        self.content[key] = value

    def get_all(self, key: str):
        return [ value for cfg in self.content.values() if (value := cfg.get(key)) ]

class ConfigLoaderOptions(BaseModel):
    match: List[str] = DEFAULT_MATCH


def beet_default(ctx: Context):
    ctx.require(load_config)

@configurable(validator=ConfigLoaderOptions)
def load_config(ctx: Context, ops):
    #config = Config(ctx.meta.get("config", {}))
    config = ctx.meta.get("config", cast(JsonDict, {}))
    namespaces = config.get("namespaces", cast(JsonDict, {}))
    for pattern in ops.match:
        for path in ctx.directory.glob(pattern):
            content = load_file(path)
            id = content.get("id", path.stem)
            value = content.get("value", {})
            value.setdefault("ores", {})
            value.setdefault("tools", {})
            if condition := content.get("condition"):
                if type(condition) is not list:
                    condition = [ condition ]
                value["condition"] = condition
            namespaces[id] = value
    config["namespaces"] = namespaces
    ctx.meta["config"] = config
    ctx.inject(Runtime).expose("config", config)

def load_file(path):
    try: return json.loads(path.read_text())
    except: return {}

#def validate(output: JsonDict, )