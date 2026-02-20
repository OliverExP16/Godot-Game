extends Node

var score: int = 0
var score_label: Label = null

func add_point():
	score += 1
	if score_label:
		score_label.text = str(score)

func reset_score():
	score = 0
	if score_label:
		score_label.text = "0"
