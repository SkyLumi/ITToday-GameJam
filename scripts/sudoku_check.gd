extends Node2D

@warning_ignore("unused_signal")
signal tombol_benar

@onready var lampu1 = $Lampu
@onready var lampu2 = $Lampu2
@onready var lampu3 = $Lampu3
@onready var lampu4 = $Lampu4
@onready var lampu5 = $Lampu5
@onready var lampu6 = $Lampu6
@onready var lampu7 = $Lampu7
@onready var lampu8 = $Lampu8

var stop = false

func _process(_delta: float) -> void:
	if !stop and lampu1.warna == "merah" and lampu2.warna == "biru" and lampu3.warna == "kuning" and lampu4.warna == "kuning" and lampu5.warna == "ijo" and lampu6.warna == "biru" and lampu7.warna == "kuning" and lampu8.warna == "ijo":
		emit_signal("tombol_benar")
		Global.pintu_map3_terbuka = true
		stop = true
