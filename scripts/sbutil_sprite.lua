function RemoveSprite(name)
	--removes a sprite from the sprite table with the given savename
	--example usage: RemoveSprite("hud-group-missile")
	for k, v in ipairs(Sprites) do
		if v.Name == name then
			table.remove(Sprites, k)
		end
	end
end

function FindSprite(saveName)
	--returns sprite if found
	--example usage: FindSprite("hud-group-missile")
	for k, v in ipairs(Sprites) do
		if v.Name == saveName then
			return k
		end
	end
	return nil
end

function SpriteSheet(texture, iterations, iterations_per_row, duration)
	--create an animated Frames table from a sprite sheet.
	--iterations is total amount of frames. 
	--iterations_per_column is the number of frames per row.
	--duration is each frame's duration. (game works on multiples of 0.04)
	--example usage: SpriteSheet(path .. "/sprite_sheet.png", 12, 4, 0.08)
	local Frames = {}
	for i = 0, iterations - 1, 1 do
		table.insert(Frames, 
		{ 
			texture = texture, 
			left = (i % iterations_per_row) / iterations_per_row,
			right = ((i % iterations_per_row) + 1) / iterations_per_row,
			top = math.floor(i / iterations_per_row) / math.ceil(iterations / iterations_per_row),
			bottom = math.floor((i / iterations_per_row) + 1) / math.ceil(iterations / iterations_per_row)
		})
	end
	Frames.duration = duration
	Frames.mipmap = true
	
	return Frames
end

function MoveTexture(iterations, duration, texture, startLeft, startRight, startTop, startBottom, moveLeft, moveRight, moveTop, moveBottom)
	--move a texture cropping across frames. example: 0,1,0,1 is full image. 0.5,1,0.5,1 is the lower right quarter of the image.
	--for sprites
	--example usage: "MoveTexture(30, 0.04, path .. "/animated_texture.png", 0.5, 1, 0, 1, 0, 1, 0, 1)" will move the left crop from middle of image to left side of image.
	local Frames = {}
	for i = 0, iterations - 1, 1 do
		table.insert(Frames, 
		{ 
			texture = texture, 
			left = startLeft - (i * (moveLeft/iterations)),
			right = startRight - (i * (moveRight/iterations)),
			top = startTop - (i * (moveTop/iterations)),
			bottom = startBottom - (i * (moveBottom/iterations)),
		})
	end
	Frames.duration = duration
	Frames.mipmap = true
	
	return Frames
end