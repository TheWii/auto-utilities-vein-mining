from beet import Context

def beet_default(ctx: Context):
    for path in ctx.data.functions.match("*"):
        function = ctx.data.functions[path]
        if len(function.lines) == 0:
            ctx.data.functions.pop(path)