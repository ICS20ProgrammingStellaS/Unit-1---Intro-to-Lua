-- Title: WhackAMole
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------------------------
local points = 0
local pointsText

-- creating background
local bkg = display.newImageRect( "Images/bkg.png", display.contentWidth, display.contentHeight )

	-- Setting Position 
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0 

-- Creating Mole
local mole = display.newImage( "Images/mole.png", 0, 0 )
	-- Setting Position
	mole.x = contentCenterX
	mole.y = contentCenterY

	mole:scale(0.3, 0.3)
	
	mole.isVisible = false

------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------

-- This function makes the mole appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp( )

 	-- Choosing Random Position on the screen between 0 and the size of the screen
 	mole.x = math.random( 0, display.contentWidth )
 	mole.y = math.random( 0, display.contentHeight )

 	-- Making mole visible
 	mole.isVisible = true

 	-- add timerWithDelay
 	timer.performWithDelay( 1000, Hide)
end 

-- This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 2000, PopUp )
end

-- This function makes the mole invisible and then calls the PopUpDelay functions
function Hide( )

	-- Changing Visibility
	mole.isVisible = false

	-- add timerWithDelay
	timer.performWithDelay( 2000, PopUpDelay )	
end

-- This function starts the game 
function GameStart( )
	PopUpDelay( )
end

-- This function increments the score only if the mole id clicked. It the displays the
-- new score.
function Whacked( event )

	-- If touch phase just started
	if (event.phase == "began") then

		points = points + 1

		-- update it in the display object
		pointsText.text = "Points = " .. points
	end
end


pointsText = display.newText("Points = ", 150, 50, Arial, 50)
pointsText:setTextColor (0, 0, 0)
-----------------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------------

-- I add the vent listener to the moles so that if the mole is touched, the Whacked
-- function is called
mole:addEventListener( "touch", Whacked )

GameStart( )