extends Control

@onready var conb = $conb
@onready var ipin = $ipin
@onready var ptin = $portin
@onready var oscm = $"../oscm"
@onready var oscc = $"../oscc"

func _ready():
	conb.pressed.connect(refr)
	refr()

func refr():
	oscc.connect_socket(ipin.text,int(ptin.text))
