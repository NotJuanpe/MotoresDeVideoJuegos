extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	self.text = str(Global.score)

func _process(delta):
	self.text = str(Global.score)
