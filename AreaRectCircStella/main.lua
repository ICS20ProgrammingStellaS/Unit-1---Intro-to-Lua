-- Title: AreaOfRectangleAndCircle
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays a rectangle and shows its area

-- create my local variable
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local AreaOfRectangle
local areaTextCircle
local textSize = 50
local myCircle
local radiusOfCircle = 175
local AreaOfCircle
local PI = 3.14

-- set the backround colour of my screen. 
-- Remember that colours are between 0 and 1
display.setDefault("background", 204/255, 255/255, 229/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the recangle that is half the width and height of the screens size. 
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- draw the circle. 
myCircle = display.newCircle(650, 0, radiusOfCircle)

-- anchor the rectangle in the top left corner of the screen 
-- set the circle in the top right corner and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 630
myCircle.y = 20

-- set the width of the border for rectangle
myRectangle.strokeWidth = 20

-- set the width of the border for circle
myCircle.strokeWidth = 20

-- set the colour of the rectangle
myRectangle:setFillColor(204/255, 255/255, 255/255)

-- set the colour of the circle
myCircle:setFillColor(51/255, 51/255, 255/255)

-- set the color of the border of the rectangle
myRectangle:setStrokeColor(204/255, 204/255, 255/255)

-- set the color of the border of the circle 
myCircle:setStrokeColor(229/255, 204/255, 255/255)

-- calculate the area of the rectangle
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- calculate the area of the circle
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- write the area of the rectangle on the screen. Take into consideration the size of
-- the font when positioning it on the screen.
areaText = display.newText("The area of this rectangle with a width of \n"..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels². ", 0, 0, Arial, textSize)

-- write the area of the circle on the screen. Take into consideration the size of
-- the font when positioning it on the screen.
areaTextCircle = display.newText("The area of this circle with a radius of \n"..
	radiusOfCircle .. " is " ..
	areaOfCircle .. " pixels². ", 0, 50, Arial, textSize)

-- anchor the text and set its (x,y) position for rectangle
areaText.anchorX = 0
areaText.anchorY = 0 
areaText.x = 20
areaText.y = display.contentHeight/2

-- anchor the text and set its (x,y) position for circle
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 20
areaTextCircle.y = 600

-- set the colour of the newText of the rectangle
areaText:setTextColor(255/255, 178/255, 102/255)

-- set the colour of the newText of the circle
areaTextCircle:setTextColor(255/255, 153/255, 153/255)
