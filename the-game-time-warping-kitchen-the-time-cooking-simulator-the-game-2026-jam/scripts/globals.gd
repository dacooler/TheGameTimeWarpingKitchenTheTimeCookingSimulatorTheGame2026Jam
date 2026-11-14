class_name Globals

enum Produce {
	ONION,
	TOMATO,
	CHOPPED_ONION,
	CHOPPED_TOMATO,
	SAUCE,
	ASH,
	ONION_SEED,
	TOMATO_SEED
}
const ASH = preload("uid://ccc0nxw0hf6hc")
<<<<<<< HEAD
const TOMATO = preload("uid://byqa1rf148246")
const ONION_CHOPPED = preload("uid://cpi5xtyfyoxxd")
const ONION = preload("uid://bojgpg1f26ws8")
const SAUCE = preload("uid://cybkytvgiuri7")
const TOMATO_COOKED = preload("uid://di6c6fitmaqp6")
const ONION_SEED = preload("uid://bn7en5xkegemx")
const TOMATO_SEED = preload("uid://jteskuesaafy")
=======
const ONION_CHOPPED = preload("uid://ddsxfbum3h6lg")
const SAUCE = preload("uid://cybkytvgiuri7")
const TOMATO_COOKED = preload("uid://di6c6fitmaqp6")
const TOMATO = preload("uid://cbfllugif8qoa")
const ONION = preload("uid://svou3n3450pm")
>>>>>>> 1a037c6d9e6a9409c72beee832453d5736f20b7c

static var produceImages = {
	Produce.ASH : ASH,
	Produce.TOMATO: TOMATO,
	Produce.ONION: ONION,
	Produce.CHOPPED_ONION: ONION_CHOPPED,
	Produce.SAUCE: SAUCE,
	Produce.CHOPPED_TOMATO: TOMATO_COOKED,
	Produce.ONION_SEED: ONION_SEED,
	Produce.TOMATO_SEED: TOMATO_SEED
}

const IP_ADDRESS := "127.0.0.1"
const PORT := 6767
const MAX_CLIENTS := 7

static var coins := 0
