if $raycast.is_colliding():
	var n = $raycast.get_collision_normal()
	var slope_angle = (rad2deg(acos(n.dot(Vector3(0,-1,0)))) -180)*-1
	if slope_angle > 20:
		var slide_dir = n.slide(Vector3(0,-1,0))
		#velocity is from by your code
		velocity += slide_dir * 5
		#use to rotate the character
		$character.rotation.y = atan2(slide_dir.x,slide_dir.y+slide_dir.z)
		#use to tilt the character
		$character.rotation.x = deg2rad(slope_angle)
	$character.move_and_slide(velocity,Vector3(0,1,0))
	
