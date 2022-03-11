
def offsetGrid(least, most):
    offsetRange = range(least, most+1)
    for x in offsetRange:
        for y in offsetRange:
            for z in offsetRange:
                yield [ x, y, z ]