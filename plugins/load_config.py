import json
from typing import Dict, List, cast
from pydantic import BaseModel

from beet import Context, configurable
from beet.core.utils import JsonDict
from bolt import Runtime

DEFAULT_MATCH = [ "config/**/*.json" ]

class ConfigLoaderOptions(BaseModel):
    match: List[str] = DEFAULT_MATCH


def beet_default(ctx: Context):
    ctx.require(load_config)

@configurable(validator=ConfigLoaderOptions)
def load_config(ctx: Context, ops):
    config = ctx.meta.get("config", cast(JsonDict, {}))
    config.setdefault("namespaces", cast(JsonDict, {}))
    for pattern in ops.match:
        for path in ctx.directory.glob(pattern):
            contents = load_file(path)
            id = contents.get("id", path.stem)
            merge_config(config, contents, id)
    ctx.meta["config"] = config
    ctx.inject(Runtime).expose("config", config)

def load_file(path):
    try: return json.loads(path.read_text())
    except: return {}

def merge_config(config: JsonDict, contents: Dict, id: str):
    value = contents.get("value", {})
    value.setdefault("ores", {})
    value.setdefault("tools", {})

    for ore in value["ores"].values():
        ore: Dict
        # blocks with state can't be on tags
        # and can't belong to a mining level
        if ore.get("state"):
            ore.pop("tag", None)
            ore.pop("mining_level", None)

    if cond := contents.get("condition"):
        value["condition"] = cond if type(cond) is list else [ cond ]

    config["namespaces"][id] = value