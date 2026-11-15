class_name Globals



enum Produce {
	ONION,
	TOMATO,
	CHOPPED_ONION,
	CHOPPED_TOMATO,
	SAUCE,
	ASH,
	ONION_SEED,
	TOMATO_SEED,
	PASTA,
	TOMATO_PASTA
}


const ASH = preload("res://images/aska.png")
const TOMATO = preload("res://images/tomato.png")
const ONION = preload("res://images/onion.png")
const ONION_CHOPPED = preload("res://images/cut_onion.png")
const SAUCE = preload("res://images/tomato_sauce.png")
const TOMATO_CHOPPED = preload("res://images/cut_tomato.png")
const ONION_SEED = preload("res://images/onion_seed.png")
const TOMATO_SEED = preload("res://images/tomato_seed.png")
const PASTA = preload("res://images/pasta.png")
const TOMATO_PASTA = preload("res://images/pasta_pompedoro.png")

static var produceImages = {
	Produce.ASH : ASH,
	Produce.TOMATO: TOMATO,
	Produce.ONION: ONION,
	Produce.CHOPPED_ONION: ONION_CHOPPED,
	Produce.SAUCE: SAUCE,
	Produce.CHOPPED_TOMATO: TOMATO_CHOPPED,
	Produce.ONION_SEED: ONION_SEED,
	Produce.TOMATO_SEED: TOMATO_SEED,
	Produce.PASTA: PASTA,
	Produce.TOMATO_PASTA: TOMATO_PASTA,
}

static var IP_ADDRESS := "127.0.0.1"
const PORT := 6767
const MAX_CLIENTS := 7

static var coins := 0

static var time := 5
