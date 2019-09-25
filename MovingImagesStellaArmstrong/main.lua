-- Title: MovingObjects
-- Name: Your Name
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scroolSpeed = 3

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local bettleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- ste the ingae 