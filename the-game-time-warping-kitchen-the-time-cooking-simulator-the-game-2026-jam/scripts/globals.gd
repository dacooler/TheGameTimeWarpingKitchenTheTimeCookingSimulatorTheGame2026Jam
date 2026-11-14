class_name Globals

enum Produce {
	ONION,
	TOMATO,
	COOKED_ONION,
	COOKED_TOMATO,
	ASH,
}
const ASH = preload("uid://ccc0nxw0hf6hc")
const ONION_COOKED = preload("uid://bqf5mkucndggp")
const TOMATO = preload("uid://byqa1rf148246")
const TOMATO_COOKED = preload("uid://di6c6fitmaqp6")

var produceImages = {
	Produce.ASH : ASH,
	Produce.COOKED_ONION: ONION_COOKED,
	Produce.COOKED_TOMATO: TOMATO_COOKED,
	Produce.TOMATO: TOMATO,
}

const IP_ADDRESS := "172.20.40.220"
const PORT := 6767
const MAX_CLIENTS := 7
