extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var os = ""
var curlexist = false
var term = ""
var turn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	if OS.get_name() == "X11":
		os = "linux"
	
	if os == "linux":
		curlexist = _exist("curl")
		if curlexist == false:
			$curldetect.show()
		if _exist("xterm"):
			term = "xterm"
		else:
			if _exist("lxterm"):
				term = "lxterm"
			else:
				if _exist("lxterminal"):
					term = "lxterminal"
				else:
					if _exist("uxterm"):
						term = "uxterm"
					else:
						if _exist("x-terminal-emulator"):
							term = "x-terminal-emulator"
						else:
							_donthaveterm()

func _donthaveterm():
	$term.show()
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
	_download_start()
	_download_mid("64")
	_download_end()
	$install/text.text = "Done."
		
		
func _on_32_pressed():
	_download_start()
	_download_mid("32")
	_download_end()
	$install/text.text = "Done."

func _download_start():
	if curlexist == true and term != "":
		$install/text.text = "Creating Files"
		OS.execute(term, ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/start.sh | bash"])
	
func _download_mid(var arch :String):
	if curlexist == true and term != "":
		$install/text.text = "Installing Game"
		if arch == "64":
			OS.execute(term, ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/download64.sh | bash"])
		if arch == "32":
			OS.execute(term, ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/download32.sh | bash"])
func _download_end():
	if curlexist == true and term != "":
		$install/text.text = "Creating Shortcuts"
		OS.execute(term, ["-e", "curl -s https://raw.githubusercontent.com/OpenTicTacToeX/installer/main/linux/end.sh | bash"])
func _on_curldetect_exit_pressed():
	get_tree().quit()

