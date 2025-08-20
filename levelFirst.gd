extends Node2D
var hpoint =-1
var player1 : CharacterBody2D
var xpoint
var SLIME =preload("res://enemy.tscn")
var HEALER =preload("res://heart.tscn")
@onready var world = get_node("/root/world")
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	if $AudioStreamPlayer2D.finished:
		$AudioStreamPlayer2D.play()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hpoint = $Player.HP
	xpoint = $Player.XP
	if hpoint > 0:
		match hpoint:
			5:
				$Health.set_text("❤️❤️❤️❤️❤️️")
			4:
				$Health.set_text("❤️❤️❤️❤️")
			3:
				$Health.set_text("❤️❤️❤️")
			2:
				$Health.set_text("❤️❤️")
			1:
				$Health.set_text("❤️")
	else:
		$Health.set_text("")
		get_tree().paused = true
		$Label.text="Your Score:" + str(xpoint)+" Try Again"
	
	$Experience.text="💎:" + str(xpoint)
	pass


func _on_timer_timeout():
	#$Timer.start(randf_range(1.5,2))
	var slime = SLIME.instantiate()
	world.add_child(slime)
	slime.position.x = 175
	slime.position.y = 504
	#$Timer.start()
	pass # Replace with function body.


func _on_timer_2_timeout():
	#$Timer.start(randf_range(1.5,3))
	var slime = SLIME.instantiate()
	world.add_child(slime)
	slime.position.x = 450
	slime.position.y = 504
	#$Timer2.start()
	pass # Replace with function body.


func _on_timer_3_timeout():
	#$Timer.start(randf_range(1,4))
	var slime = SLIME.instantiate()
	world.add_child(slime)
	slime.position.x = 1000
	slime.position.y = 504
	#$Timer3.start()
	pass # Replace with function body.


func _on_timer_4_timeout():
	var healer = HEALER.instantiate()
	world.add_child(healer)
	healer.position.x = 450
	healer.position.y = 360
