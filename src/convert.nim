import std/strutils

func convert(s: string): string =
    var r = s

    # s -> sh
    r = r.replace("as", "ash")
    r = r.replace("is", "ish")
    r = r.replace("us", "ush")
    r = r.replace("es", "esh")
    r = r.replace("es", "osh")

    r = r.replace("si", "shi")
    r = r.replace("sí", "shí")

    # c -> ch
    r = r.replace("c", "ch")

    # pp, tt, kk -> p#p, t#t, k#k
    r = r.replace("pp", "p p")
    r = r.replace("tt", "t t")
    r = r.replace("kk", "k k")

    # ay -> ai
    r = r.replace("ay", "ai")

    # kp -> k#p
    r = r.replace("kp", "k p")

    # -,= -> ""
    r = r.replace("-", "")
    r = r.replace("=", "")

    r