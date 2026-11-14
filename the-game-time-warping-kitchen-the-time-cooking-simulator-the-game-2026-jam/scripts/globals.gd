class_name Globals

enum Produce {
	ONION,
	TOMATO,
	CHOPPED_ONION,
	CHOPPED_TOMATO,
	SAUCE,
	ASH,
}
const ASH = preload("uid://ccc0nxw0hf6hc")
const ONION_CHOPPED = preload("uid://ddsxfbum3h6lg")
const SAUCE = preload("uid://cybkytvgiuri7")
const TOMATO_COOKED = preload("uid://di6c6fitmaqp6")
const TOMATO = preload("uid://cbfllugif8qoa")
const ONION = preload("uid://svou3n3450pm")

static var produceImages = {
	Produce.ASH : ASH,
	Produce.TOMATO: TOMATO,
	Produce.ONION: ONION,
	Produce.CHOPPED_ONION: ONION_CHOPPED,
	Produce.SAUCE: SAUCE,
	Produce.CHOPPED_TOMATO: TOMATO_COOKED
}

const IP_ADDRESS := "127.0.0.1"
const PORT := 6767
const MAX_CLIENTS := 7

static var coins := 0
