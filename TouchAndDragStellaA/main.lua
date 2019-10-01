-- Title: TouchAndDrag
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays images that reacte to a person's finger.

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)
local yellowCat = display.newImageRect("Images/yellowCat.png", 150, 150)
local yellowCatWidth = yellowCat.width
local yellowCatHeight = yellowCat.height 

local orangeDog = display.newImageRect("Images/orangeDog.png", 150, 150)
local orangeDogWidth = orangeDog.width
local orangeDogHeight = orangeDog.height 

-- my boolean variables to keep track of width object I touched frist
local alreadyTouchedYellowCat = false
local alreadyTouchedOrangeDog = false

-- set the initial x and y position of my Image
yellowCat.x = 700
yellowCat.y = 600

orangeDog.x = 300
orangeDog.y = 575

-- Function: OrangeDogListner
-- Input: touch listener
-- Output: none
-- Description: when orange dog is touched, move her
local function OrangeDogListener(touch)
 
    if (touch.phase == "began") then
  	     if (alreadyTouchedYellowCat == false) then
  	        alreadyTouchedOrangeDog = true
  	     end 
  	end 

  	if ( (touch.phase == "moved") and (alreadyTouchedOrangeDog) ) then
  		orangeDog.x = touch.x
  		orangeDog.y = touch.y
  	end

  	if (touch.phase == "ended") then 
  		alreadyTouchedOrangeDog = false
  		alreadyTouchedYellowCat = false
  	end
end 

local function YellowCatListener(touch)
 
    if (touch.phase == "began") then
  	     if (alreadyTouchedOrangeDog == false) then
  	        alreadyTouchedYellowCat = true
  	     end 
  	end 

  	if ( (touch.phase == "moved") and (alreadyTouchedYellowCat) ) then
  		yellowCat.x = touch.x
  		yellowCat.y = touch.y
  	end

  	if (touch.phase == "ended") then 
  		alreadyTouchedYellowCat = false
  		alreadyTouchedOrangeDog  = false
  	end
end 

-- add the respective listener to each object 
orangeDog:addEventListener("touch", OrangeDogListener)

yellowCat:addEventListener("touch", YellowCatListener)