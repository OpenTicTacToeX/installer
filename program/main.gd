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
	var lala = []
	if curlexist == true:
		

		
		$install/text.text = "Creating Files"
		OS.execute("xterm", ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/start.sh | bash"])
		$install/text.text = "Installing Game"
		OS.execute("xterm", ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/download64.sh | bash"])
		$install/text.text = "Creating Shortcuts"
		OS.execute("xterm", ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/end.sh | bash"])
		$install/text.text = "Done."


func _on_curldetect_exit_pressed():
	get_tree().quit()
