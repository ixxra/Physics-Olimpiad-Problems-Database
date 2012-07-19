/\\title/{
    #First... extract \title and \textbf
    s@\\title\s*\{(.*)\}@\1@
    s@\\textbf\s*\{(.*)\}@\1@

    #Next two steps could be optimized into a sigle one
    s@Problema\s+Teórico\s+[1-9]\s*@@
    s@\\\\@@
    /^$/!s@(.*)@[\1]@
    h
}

/\\begin\{prob\}/{
    G
    s/\n//
}

/\\begin\{prob\}/,/\\end\{prob\}/p

