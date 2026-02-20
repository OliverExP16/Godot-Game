extends Label

func _ready():
	GameManager.score_label = self
	text = "0"
