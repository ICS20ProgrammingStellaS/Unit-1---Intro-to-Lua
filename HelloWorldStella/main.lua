-- Title: HelloWorld
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays Hello to the simulator and to the command terminal.
-- print to the command terminal
print("Hello Stella!")
print("I love this class!")

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

--sets the backround colour
display.setDefault("background", 102/255, 102/255, 255/255)

-- create a local variable
local textObject

-- display text on screen at position x = 500 and y = 500 with
-- a defult font style and font size of 50
textObject = display.newText("Hello Nahla!", display.contentWidth/2, display.contentHeight/2, nil, 100)

-- set the color of the text 
textObject:setTextColor(153/255, 204/255, 255/255)

-- create a local variable
-- display text on screen at position x = 500 and y = 525 with
-- a defult font style and font size of 50
local textObjectSignature = display.newText("By: Stella Armstrong", 500, 525, nil, 50)

-- set the color of the signature text 
textObjectSignature:setTextColor(204/255, 204/255, 255/255)

