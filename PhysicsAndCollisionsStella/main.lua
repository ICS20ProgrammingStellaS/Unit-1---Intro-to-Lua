-- Title: Physics and Collision
-- Name: Stella Armstrong
-- Course: ICS20
-- This program displays 4 different balls/objects that falls from different
--  sides of the screen onto a slide and diving board. I added a diving wall 
-- on the sides of the screen to stop the balls/objects from rolling.
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- add background image with width and height 
local backgroundImage = display.newImageRect("Images/Pool.jpg", 2048, 1536)
backgroundImage.x = 500
backgroundImage.y = 0

-- load physics
local physics = require("physics")

-- start physics
physics.start()
----------------------------------------------------------------------------------------------
-- OBJECTS
----------------------------------------------------------------------------------------------
local divingBoard = display.newImage("Physics/divingBoard.png", 0, 0)
	divingBoard.x = 500
	divingBoard.y = 700

	-- change the width to be the same as the screen
	divingBoard.width = display.contentWidth

	-- add the physics
	physics.addBody(divingBoard, "static", {friction=0.5, bounce=0.3})

	------------------------------------------------------------------------------------