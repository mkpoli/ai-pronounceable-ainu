import std/unittest
include convert

suite "convert module":
    test "s -> sh":
        check convert("sukus") == "sukush"
        check convert("siknu") == "shiknu"
        check convert("aske") == "ashke"
        check convert("niska") == "nishka"
        check convert("sírpeker") == "shírpeker"

    test "c -> ch":
        check convert("cupu") == "chupu"
        check convert("cas") == "chash"
        check convert("cep") == "chep"

    test "pp, tt, kk -> p#p, t#t, k#k":
        check convert("okaramotte") == "okaramot te"
        check convert("aeppo") == "aep po"
        check convert("yakka") == "yak ka"

    test "ay -> ai":
        check convert("paykar") == "paikar"

    test "kp -> k#p":
        check convert("kotekparparu") == "kotek parparu"

    test "-,= -> ":
        check convert("ku=anu") == "kuanu"
