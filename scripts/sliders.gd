extends Control

@onready var clibr = $clibr
@onready var oscc = $"../oscc"
@onready var oscm = $"../oscm"

var list
func _ready():
	clibr.pressed.connect(amap)
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

func scr(val,nam):
	if oscc.client.is_socket_connected():
		oscm.send_message("/bespoke/slid"+str(nam),[val])
