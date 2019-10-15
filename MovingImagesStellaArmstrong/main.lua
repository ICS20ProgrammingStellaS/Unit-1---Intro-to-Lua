-- Title: MovingObjects
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------

-- add backgroun music
local backgroundSound = audio.loadSound("Sounds/backgroundSound.mp3")
local backgroundSoundChannel

audio.play(backgroundSound, {loops = -1})
backgroundSoundChannel = audio.play(backgroundSound)

-- global variables
scrollSpeed2 = 4 - 8

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 300, 350)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of bettleship
beetleship.x = 1000
beetleship.y = 500

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship 
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed2
	-- change the transparency of the ship every time it moves so that it fades out 
	beetleship.alpha = beetleship.alpha + 0.05
	-- make beetleship shrink
	   beetleship.xScale = beetleship.xScale - 0.0001
	beetleship.yScale = beetleship.yScale - 0.001
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- flip beetleship around
beetleship:scale(-1, 1)
-----------------------------------------------------------------------------------
-- global variables
scrollSpeed = 5

-- character image with width and height 
local octopus = display.newImageRect("Images/octopus.png", 100, 100)

-- set the image to be transparent
octopus.alpha = 0

-- set the initial x and y position of octopus
octopus.x = 20
octopus.y = octopus.x^2

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship 
local function MoveShip2(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out 
	octopus.alpha = octopus.alpha + 0.05
	-- make octopus grow
		octopus.xScale = octopus.xScale + 0.01
	octopus.yScale = octopus.yScale + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip2)

