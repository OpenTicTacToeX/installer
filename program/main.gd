extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var os = ""
var curlexist = false


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	if OS.get_name() == "X11":
		os = "linux"
	
	if os == "linux":
		curlexist = _exist("curl")
		if curlexist == false:
			$curldetect.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exist(var programlinux : String):
	var seecurl = File.new()
	if seecurl.file_exists("/bin/" + programlinux) or seecurl.file_exists("/sbin/" + programlinux) or seecurl.file_exists("/usr/bin/" + programlinux):
		return true
	else:
		return false
	
func _on_64_pressed():
	if curlexist == true:
		$install/text.text = "Creating Files"
		OS.execute()


func _on_curldetect_exit_pressed():
	get_tree().quit()
