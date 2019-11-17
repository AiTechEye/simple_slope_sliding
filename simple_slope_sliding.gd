if $raycast.is_colliding():
	var n = $raycast.get_collision_normal()
	var slope_angle = (rad2deg(acos(n.dot(Vector3(0,-1,0)))) -180)*-1
	if slope_angle > 20:
		var slide_dir = n.slide(Vector3(0,-1,0))
		velocity += slide_dir * 5
		var angle = slope_angle
		$character.rotation.y = atan2(slide_dir.x,slide_dir.y+slide_dir.z)
		$character.rotation.x = deg2rad(sliding.angle)
	$character.move_and_slide(character.body.get_floor_velocity()+velocity,Vector3(0,1,0))
	