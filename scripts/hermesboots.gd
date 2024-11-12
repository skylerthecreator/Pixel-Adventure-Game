extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var game_manager = %GameManager
@onready var insufficientfunds = $insufficientfunds


const COST = 8
const SPEED_INC = 25
var player = null

func _on_body_entered(body):
	player = body
	player.buy = false

func _process(_delta):
	if player and player.buy and game_manager.coins >= COST:
		game_manager.coins -= COST
		player.speed += SPEED_INC
		animation_player.play("pickup")
		player = null
	elif player and player.buy and game_manager.coins < COST:
		insufficientfunds.play()
		
func _on_body_exited(_body):
	player = null
	



