extends Control

@onready var oscm = $"../oscc"
@onready var clibr = $clibr

var list
func _ready():
	clibr.pressed.connect(amap)
	list=get_tree().get_nodes_in_group("sliderg")
	var a=0
	for i in list:
		i.value_changed.connect(scr.bind(str(a)))
		a=a+1
	amap()

func amap():
	for i in list:
		i.value=1
	for i in list:
		i.value=0

func scr(val,nam):
	print(str(nam)+" : "+str(val))
	oscm.send_message("/"+nam,[val])
