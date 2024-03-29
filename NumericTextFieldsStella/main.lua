-- Title: NumericTextFields
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfeild.
-- terminal
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 204/255, 153/255)

---------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local correctPoints = 0
local correctPointsText
local incorrectPoints = 3
local lostGame
local wonGame 
local incorrectPointsObject

---------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user answers and the correct answer are the same:
		if (userAnswer == correctAnswer) then 
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			-- give a point if the user gets the correct answer
			correctPoints = correctPoints + 1

			-- update it in the display object
			correctPointsText.text = "Points = " .. correctPoints


		else 
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect)
			-- give a point if the user gets the incorrect answer
			incorrectPoints = incorrectPoints - 1

			-- update it in the display object
			incorrectPointsText.text = "Lives = " .. incorrectPoints

		end
		-- clear text field
		event.target.text = ""

		-- if the user answers and get three wrong or five right:
		if (incorrectPoints == 0) then
			incorrectObject.isVisible = false

			-- add text that say end game
			display.lostGame = display.newText("Sorry, you lost!", display.contentWidth/2, display.contentHeight/2, nil, 75)
    		display.lostGame:setTextColor(255/255, 102/255, 102/255)	
    		incorrectPointsObject.isVisible = false
    		correctPointsObject.isVisible = false
    		correctObject.isVisible = false
    		incorrectObject.isVisible = false
    		questionObject.isVisible = false
    		numericField.isVisible = false

    	elseif (correctPoints == 5) then
			correctObject.isVisible = false

			-- add text that say end game
			display.wonGame = display.newText("Yay, you won!", display.contentWidth/2, display.contentHeight/2, nil, 75)
    		display.wonGame:setTextColor(255/255, 102/255, 102/255)	
    		incorrectPointsObject.isVisible = false
    		correctPointsObject.isVisible = false
    		correctObject.isVisible = false
    		incorrectObject.isVisible = false
    		questionObject.isVisible = false
    		numericField.isVisible = false 
		end
	end
end

---------------------------------------------------------------------------------------------
-- OBJECT CREATION 
---------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(155/255, 42/255, 198/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
correctPointsText = display.newText("Points = " .. correctPoints, 200, 200, nil, 50)
correctPointsText:setTextColor(178/255, 102/255, 255/255)

-- display the amount of points as a text object
incorrectPointsText = display.newText("Lives = " .. incorrectPoints, 800, 200, nil, 50)
incorrectPointsText:setTextColor(178/255, 102/255, 255/255)
--------------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()