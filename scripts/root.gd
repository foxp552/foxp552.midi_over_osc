extends Control

@onready var backb = $back
@onready var settb = $sett
@onready var buttb = $butt
@onready var slidb = $slid
@onready var discb = $disc

@onready var butts = $buttons
@onready var slids = $sliders
@onready var setts = $setting

@onready var oscc = $oscc

func _ready():
	back()
	backb.pressed.connect(back)
	settb.pressed.connect(sett)
	buttb.pressed.connect(butt)
	slidb.pressed.connect(slid)
	discb.pressed.connect(disc)

func disc():
	oscc.close_socket()

func back():
	setts.visible=false
	butts.visible=false
	slids.visible=false
	pass

func sett():
	setts.visible=true
	butts.visible=false
	slids.visible=false
	pass

func butt():
	setts.visible=false
	butts.visible=true
	slids.visible=false
	pass

func slid():
	butts.visible=false
	setts.visible=false
	slids.visible=true
	pass
