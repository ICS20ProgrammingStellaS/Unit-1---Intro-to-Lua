-- Title: Physics and Collision
-- Name: Stella Armstrong
-- Course: ICS20
-- This program displays 4 different balls/objects that falls from different
--  sides of the screen onto a slide and diving board. I added a diving wall 
-- on the sides of the screen to stop the balls/objects from rolling.
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
----------------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------------
-- GROUND
local ground = display.newImage("Images/ground.png", 0, 0)

	-- set the x and y pos
	ground.y = 750
	ground.x = 515

	-- change width to be the same as the screen
	ground.width = display.contentWidth

	-- add the physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------------
-- BEAM
local beam = display.newImage("Images/beam.png", 0, 0)

	-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- change width to be half of the size of the screen
	beam.width = display.contentWidth/2

	-- change height to be one tenth of the size of the screen 
	beam.height = display.contentHeight/10

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer 
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------------------------
-- LONG BEAM/WALL 
local beam2 = display.newImage("Images/beam.png", 0, 0)

	-- set the x and y pos
	beam2.x = display.contentCenterX*13.5/7
	beam2.y = display.contentCenterY

	-- set width and height to the width and heigth of iPad
	beam2.width = display.contentWidth/10
	beam2.height = display.contentHeight

	-- send to back
	beam2:toBack()

	-- add to physics
	physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------------
-- BKG
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the x and y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set width and height to the width and heigth of iPad
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send to bcak
	bkg:toBack()

-------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	ball1.x = display.contentWidth/6
	ball1.y = display.contentHeight/4

	ball1.width = display.contentWidth/6.5
	ball1.height = display.contentHeight/5

	-- add to physics
	physics.addBody(ball1, {density=2.0, friction=0.2, bounce=0.8, radius=25})
end

local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	ball2.x = display.contentWidth/6
    ball2.y = display.contentHeight/5

    -- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.9, radius=12})
end

local function thirdBall()
	-- creating third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	ball3.x = display.contentWidth/6
    ball3.y = display.contentHeight/5

	ball3.width = display.contentWidth*1.50/6.5
	ball3.height = display.contentHeight*1.50/5

    -- add to physics
	physics.addBody(ball3, {density=1.0, friction=0.7, bounce=0.3, radius=12})
end
-------------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
-------------------------------------------------------------------------------------------
timer.performWithDelay( 100, firstBall)
timer.performWithDelay( 1100, secondBall)
timer.performWithDelay( 2200, thirdBall)
