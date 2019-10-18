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
local backgroundImage = display.newImageRect("Images/Pool.jpg", display.contentWidth, display.contentHeight)
 backgroundImage.x = 510
 backgroundImage.y = 385

-- load physics
local physics = require("physics")

-- start physics
physics.start()
----------------------------------------------------------------------------------------------
-- OBJECTS
----------------------------------------------------------------------------------------------

local divingBoard = display.newImage("Images/divingBoard.png", 0, 0)
	divingBoard.x = 220
	divingBoard.y = 610

	divingBoard.width = display.contentWidth/4
	divingBoard.height = display.contentHeight/2

	-- add the physics
	physics.addBody(divingBoard, "static", {friction=0.5, bounce=0.3})

local slide = display.newImage("Images/slide.png", 0, 0)
	slide.x = 800
	slide.y = 380

	slide.width = display.contentWidth/4
	slide.height = display.contentHeight/2

	-- change the width to be the same as the screen
	-- divingBoard.width = display.contentWidth

	-- add the physics
	physics.addBody(slide, "static", {friction=0.5, bounce=0.3})
	------------------------------------------------------------------------------------