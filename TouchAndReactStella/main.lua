-- Title: TouchAndReact
-- Name: Stella Armstron
-- Course: ICS2O
-- This program does something when i click on the button. 

-- set background colour
display.setDefault ("background", 153/255, 204/255, 255/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red Button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false


local check = display.newImageRect("Images/checkmark.png", 198, 108)
check.x = 520
check.y = 550
check.isVisible = false

local correctSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none 
-- Description: when the blue button is clicked, it will make the textappear
-- with the red button, and make blue button disappear.
local function BlueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		check.isVisible = true
		--play the sound on any available channel
		local correctSoundChannel = audio.play(correctSound)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		check.isVisible = false
	end
end

-- add the respective listener to each object
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none 
-- Description: when the blue button is clicked, it will make the textappear
-- with the red button, and make blue button disappear.
local function RedButtonListener2(touch)
	if (touch.phase == "beagn") then 
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		check.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		check.isVisible = false
	end
end

-- add the respective listener to each object
redButton:addEventListener("touch", RedButtonListener2)

