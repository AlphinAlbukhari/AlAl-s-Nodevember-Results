#tool
extends Spatial

#this script is used in many shaders, that's why it has some useless lines and variables

var seek = 0
var frame = 0
export var Seed:float = 0 # unused, ignore it
var wait = 0

func _ready():
	get_viewport().transparent_bg = true
	#get_viewport().render_target_v_flip=false
#	for i in range(18):
#		get_node("handles/h"+str(i)).position = $Line2D.get_point_position(i)
	pass

func _process(delta):
	var Length = $AnimationPlayer.get_animation("New Anim").length
	wait += 1
#	Seed += 0.0
#	$tForest.material_override.get_shader_param("base").noise.seed = int(Seed)
#	$tForest.material_override.set_shader_param("literally_seed", int($tForest.material_override.get_shader_param("base").noise.seed))
#	$tForest.material_override.set_shader_param("another_seed", int($tForest.material_override.get_shader_param("base").noise.seed))
	if wait >= 2:
		if seek <= Length:
			$AnimationPlayer.play("New Anim")
			seek+=0.015
			frame+=1
			$AnimationPlayer.seek(seek, true)
			$AnimationPlayer.stop(true)
			var img : Image = get_viewport().get_texture().get_data()
			img.convert(Image.FORMAT_RGBA8)
			img.flip_y()
			img.save_png("D://Document/sqnce/30 illusion/"+str("illusion")+str(frame)+".png")
