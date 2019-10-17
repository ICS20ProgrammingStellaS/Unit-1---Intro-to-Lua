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