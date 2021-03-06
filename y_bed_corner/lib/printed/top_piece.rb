class TopPiece < CrystalScad::Printed
	def initialize()
		@height = 3 # base height
		@bed_height = 3 # print plate
		
	end

	def part(show)
		res = cube([28,28,@height]).translate(x:-3,y:-3)
		res += cube([7-0.1,25-5.5,@height+@bed_height]).translate(x:5.5,y:5.5)
		res += cube([25-5.5,7-0.1,@height+@bed_height]).translate(x:5.5,y:5.5)
		
		res -= cube([25,25,@height+0.2]).rotate(z:45).translate(x:25,y:16,z:-0.1)

  	res -= Bolt.new(3,12).show.mirror(z:1).translate(x:2.5,y:2.5,z:10)
		
		res
	end

end	
