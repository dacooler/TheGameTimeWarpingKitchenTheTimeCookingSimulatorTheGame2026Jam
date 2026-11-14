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
const TOMATO = preload("uid://byqa1rf148246")
const ONION_CHOPPED = preload("uid://ddsxfbum3h6lg")
const ONION = preload("uid://bojgpg1f26ws8")
const SAUCE = preload("uid://cybkytvgiuri7")
const TOMATO_COOKED = preload("uid://di6c6fitmaqp6")

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
