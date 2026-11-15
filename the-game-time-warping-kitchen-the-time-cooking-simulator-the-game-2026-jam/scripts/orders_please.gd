extends Node2D

@onready var timer: Timer = $Timer
var seconds: int = 00
var minutes: int = 5
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var calm_music_player: AudioStreamPlayer2D = $CalmMusicPlayer
@onready var stress_music_player: AudioStreamPlayer2D = $StressMusicPlayer

func _ready():
	timer.connect("timeout", _on_timer_timeout) 
	timer.set_wait_time(1) #value is in seconds: 600 seconds = 10 minutes
	timer.set_one_shot(false)
	add_child(timer) 
	timer.start() 


func _on_timer_timeout():
	seconds -= 1
	if seconds == -1:
		seconds = 59
		minutes -= 1
	if minutes == -1:
		print("doneso")
	if (minutes == 1 && seconds == 22):
		timer.stop()
		calm_music_player.stop()
		stress_music_player.play()
	print( minutes, " : ", str(seconds).pad_zeros(2) )
	rich_text_label.clear()
	rich_text_label.add_text(str(minutes, " : ", str(seconds).pad_zeros(2)))
