from bolt import Runtime

runtime = ctx.inject(Runtime)
projectRoot = generate_path('')
thisPath = runtime.get_path()

def getPath():
    return runtime.get_path()

def fromRoot(args):
    if not isinstance(args, (list, tuple)):
        args = [ args ]
    args = map(str, args)
    return projectRoot + '/'.join(args)

def absolute(path):
    return '/'.join(path.split('/')[:-1])

def relative(args):
    if not isinstance(args, (list, tuple)):
        args = [ args ]
    args = map(str, args)
    relativeRoot = absolute(getPath())
    return relativeRoot + '/' + '/'.join(args)