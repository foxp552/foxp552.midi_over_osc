extends Control
class_name touchpad

signal relesed()
signal grabbed(vector)


@onready var but = $butnch/button

var buta=false

@export var selfx=float()
@export var selfy=float()
@export var lock=false

var sizx
var sizy
var bsxy

func _ready():
	but.pressed.connect(butmv.bind(true))
	but.released.connect(butmv.bind(false))
	sizx=size.x/2
	sizy=size.y/2

func _process(delta):
	if buta && bsxy:
		but.position.x=clamp(but.position.x+bsxy.x,-sizx,sizx)
		but.position.y=clamp(but.position.y+bsxy.y,-sizy,sizy)
		var va=clamp(-(but.position.y/sizy),0,1)
		var vb=clamp(-(but.position.x/sizx),0,1)
		var vc=clamp(-(but.position.y/-sizy),0,1)
		var vd=clamp(-(but.position.x/-sizx),0,1)
		grabbed.emit(Vector4(va,vb,vc,vd))
		bsxy=Vector2(0,0)
	selfx=but.position.x
	selfy=but.position.y

func _unhandled_input(event):
	if event :
		if event is InputEventScreenDrag:
			bsxy=event.relative/2

func resetpos():
	but.position.x=0
	but.position.y=0

func butmv(a):
	buta=a
	if a==false:
		if lock :
			resetpos()
		relesed.emit()
