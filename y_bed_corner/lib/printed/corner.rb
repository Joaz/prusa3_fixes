class Corner < CrystalScad::Printed
	def initialize()
		@height = 5 # base height from wooden plate
		@bed_height = 1.58 + 3 # height of bed + print plate
		@bottom_height = 12 # edge to the bottom
	end

	def part(show)
		res = cube([25,25,@height+@bed_height])	
		# should translate by 5.5 but thinking of leaving 0.1mm on each side margin. 
		# it should not move if clamped from the above
		res -= cube([25,25,@height+@bed_height]).translate(x:5.4,y:5.4,z:@height)		
		
		res += cube([3,25,@height+@bed_height+@bottom_height]).translate(x:-3,z:-@bottom_height)
		res += cube([25+3,3,@height+@bed_height+@bottom_height]).translate(x:-3,y:-3,z:-@bottom_height)

		res -= cylinder(d:8,h:5).translate(x:13,y:13,z:@height-0.6)
		res -= WoodScrew.new.output.mirror(z:1).translate(x:13,y:13,z:@height-0.4)

		res -= Bolt.new(3,12).show.mirror(z:1).translate(x:2.5,y:2.5,z:10)
		
		nut = Nut.new(3)
		nut.height += 0.3 + 6
		res -= nut.output.translate(x:2.5,y:2.5,z:-0.01-6)

		if !show
			res = res.rotate(x:90)
		end
	
		res
	end

end	
