extends Control

@onready var oscc = $"../oscc"
@onready var oscm = $"../oscm"

var list

func _ready():
	list=get_tree().get_nodes_in_group("buttng")
	var a=0
	for i in list:
		i.button_down.connect(bdn.bind(a))
		i.button_up.connect(bup.bind(a))
		a=a+1

func bup(nam):
	if oscc.client.is_socket_connected():
		oscm.send_message("/bespoke/note",[float(nam),0.0])

func bdn(nam):
	if oscc.client.is_socket_connected():
		oscm.send_message("/bespoke/note",[float(nam),127.0])
