extends Control

@onready var clibr = $clibr
@onready var oscc = $"../oscc"
@onready var oscm = $"../oscm"
@onready var tcc = $touchpad

var list
func _ready():
	clibr.pressed.connect(amap)
	tcc.grabbed.connect(tccmv)
	list=get_tree().get_nodes_in_group("sliderg")
	var a=0
	for i in list:
		i.value_changed.connect(scr.bind(a))
		a=a+1
	amap()

func amap():
	for i in list:
		i.value=1
	for i in list:
		i.value=0
	tccmv(Vector4(1,1,1,1))
	tccmv(Vector4(0,0,0,0))

func tccmv(val):
	var va=val.x
	var vb=val.y
	var vc=val.z
	var vd=val.w
	scr(va,"_a")
	scr(vb,"_b")
	scr(vc,"_c")
	scr(vd,"_d")

func scr(val,nam):
	if oscc.client.is_socket_connected():
		oscm.send_message("/bespoke/slid"+str(nam),[val])
