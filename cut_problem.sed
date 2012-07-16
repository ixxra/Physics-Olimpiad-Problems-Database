/\\title/{
    s@\\title.*\{(.+)\}\s*\}@[\1]@
    h
}

/\\begin\{prob\}/G
/\\begin\{prob\}/,/\\end\{prob\}/p

