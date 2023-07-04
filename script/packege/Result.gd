extends Control

var log_rich: RichTextLabel
var tt_label: Label
var ee_label: Label
var sc_label: Label
var pr_label: Label
var page_1: Control
var page_2: Control
var level_scene: String

####### PRIVATE ##########################################################
func _ready() -> void:
	level_scene = "res://scene/Level.tscn"
	
	log_rich = $Book/Page2/Log
	page_1 = $Book/Page1
	page_2 = $Book/Page2
	tt_label = $Book/Page1/TT
	ee_label = $Book/Page1/EE
	sc_label = $Book/Page1/SC
	pr_label = $Book/Page1/PR
	
	_start_result()
	
func _start_result() -> void:
	tt_label.text = "%02d" % Global.total_time
	ee_label.text = "%02d" % Global.errors
	sc_label.text = "%02d" % Global.score
	pr_label.text = "%02d" % Global.total_cards
	
	_set_log(Global.logs)
	
	page_1.show()
	page_2.hide()
	
func _set_log(logs: Array) -> void:
	log_rich.text = ""
	
	if len(logs) == 0:
		log_rich.text = "Nenhum erro encontrado"
		return
	
	for l in logs:
		log_rich.text += (l + "\n\n")
		
####### SIGNALS ##########################################################
func _on_LogsButton_pressed() -> void:
	page_1.hide()
	page_2.show()
	
func _on_ResultsButton_pressed() -> void:
	page_1.show()
	page_2.hide()

func _on_Play_pressed() -> void:
	get_tree().change_scene(level_scene)

func _on_Quit_pressed() -> void:
	get_tree().quit()
