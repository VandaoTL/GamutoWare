extends Sprite


const GRAVITY = 1800
const LAUNCH_SPEED = 900
const MAX_ROT_SPEED = PI
const LAUNCH_SPREAD = PI/6

const MAX_Y_POS = 1200


var falling = false
var vel = Vector2(0, 0)
var rot_speed = 0


func _process(delta):
	if falling:
		rotation += rot_speed * delta
		
		vel += Vector2(0, 1) * GRAVITY * delta
		position += vel * delta
	
	if position[1] > MAX_Y_POS:
		hide()

func drop():
	falling = true
	rot_speed = rand_range(-MAX_ROT_SPEED, MAX_ROT_SPEED)
	vel = Vector2(0, -LAUNCH_SPEED).rotated(rand_range(-LAUNCH_SPREAD, LAUNCH_SPREAD))
