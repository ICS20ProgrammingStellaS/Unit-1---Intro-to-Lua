-- Title: Lives and Timers
-- Name: Stella Armstrong
-- Course: ICS20
-- This program selects a random operator (*, +, -, /) 
-- and asks the user a random math question. For addition, and subtraction, 
-- the numbers range between 1 - 20. For multiplication, the numbers range between 1 - 20. 
-- For division, the numbers range between 1 - 100
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background",204/255, 204/255, 153/255)

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
local correctAnswer1
local correctAnswer2

local correctPoints = 0
local correctPointsText


local question1
local randomOperator
local tempRandomNumber

-- variables for sounds
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel
local wonGameSound = audio.loadSound("Sounds/wonGameSound.mp3")
local wonGameSoundChannel
local lostGameSound = audio.loadSound("Sounds/loseGameSound.mp3")
local lostGameSoundChannel

-- variables for the timer 
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer 

local lives = 3
local heart1
local heart2
local heart3 

-------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate a random number between 1 and 2
	-- *** MAKE SURE TO DECLARE THIS VARIABLE ABOVE
	randomOperator = math.random (1, 4)

	-- generate 2 random numbers for subtraction and addition
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)

	-- generate 2 random numbers for multiplication and is used for exponants
	randomNumber3 = math.random(1, 10)
	randomNumber4 = math.random(1, 10)

	-- generate 2 random numbers for division
	randomNumber5 = math.random(1, 10)
	randomNumber6 = math.random(1, 10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

		-- if the random operator is 2, do subtraction 
	elseif (randomOperator == 2) then 

		-- if random number 1 is smaller then random number 2 then swap them, 
		-- to get a positive answer. 
		if (randomNumber1 < randomNumber2) then
			tempRandomNumber = randomNumber1
			randomNumber1 = randomNumber2
			randomNumber2 = tempRandomNumber
		end

		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- if the random operator is 3, do multiplication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber3 * randomNumber4

		-- create question in text object
		questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "

	-- if the random operator is 4, do division 
	elseif (randomOperator == 4) then

		-- make all random numbers even for randomNumber5
		if (randomNumber5 / 2 == 0) then -- if even keep the same
		else
			randomNumber5 = randomNumber5 + 1 -- if odd add one to make even
		end

		-- do the same for randomNumber6
		if (randomNumber6 / 2 == 0) then
		else
			randomNumber6 = randomNumber6 + 1
		end

		-- calculate the correct answer 
		correctAnswer1 = randomNumber5 * randomNumber6
		correctAnswer = correctAnswer1 / randomNumber5

		-- create question in text object
		questionObject.text = correctAnswer1 .. " / " .. randomNumber5 .. " = "
	end

end

-------------------------------------------------------------------------------------------------
-- UPDATE TIMER
local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
		-- reset the number of seconds left
		secondsLeft = totalSeconds

		-- subtract a live after time runs out
		lives = lives - 1

		-- ask another question
		AskQuestion()

		--play the sound on any available channel
		wrongSoundChannel = audio.play(wrongSound)

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE 
		-- AND CANCLE THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE

		-- if time runs out, lose a life by making harets invisible
		if (lives == 3) then
				heart1.isVisible = false
		elseif (lives == 2) then
				heart2.isVisible = false
		elseif (lives == 1) then
			heart3.isVisible = false
		elseif (lives == 0) then -- if you lose all lives, make everything disappear
			heart3.isVisible = false
			heart2.isVisible = false
			heart1.isVisible = false
			clockText.isVisible = false
			incorrectPointsText.isVisible = false
    		correctPointsText.isVisible = false
    		correctObject.isVisible = false
    		incorrectObject.isVisible = false
    		questionObject.isVisible = false
    		numericField.isVisible = false

    	end

    	
		-- *** CALL THE FUNCTION TO ASK A NEW QUESTION

	end
end 

-----------------------------------------------------------------------------------------------------------------------------

-- function the calls the timer 
local function StartTimer()
	-- create a countdown timer that loops infinftely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

-------------------------------------------------------------------------------------------------------------------------
-- hide correctObject
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

----------------------------------------------------------------------------------------------------------------------------
-- hide incorrectObject
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


----------------------------------------------------------------------------------------------------------------------------

-- create NumericFieldListener
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

			secondsLeft = 10

			--play the sound on any available channel
			correctSoundChannel = audio.play(correctSound)


		else 
			incorrectObject.isVisible = true
			incorrectObject.text = " Incorrect! The correct answer is " .. correctAnswer .. "."
			timer.performWithDelay(2000, HideIncorrect)
			-- give a point if the user gets the incorrect answer
			lives = lives - 1
			
			secondsLeft = 10

			--play the sound on any available channel
			wrongSoundChannel = audio.play(wrongSound)

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE

			if (lives == 2) then 
				heart2.isVisible = false
			elseif (lives == 1) then 
				heart1.isVisible = false 
			elseif (lives == 0) then
				heart3.isVisible = false
				heart1.isVisible = false
				heart2.isVisible = false
				clockText.isVisible = false
				incorrectPointsText.isVisible = false
    			correctPointsText.isVisible = false
    			correctObject.isVisible = false
    			incorrectObject.isVisible = false
    			questionObject.isVisible = false
    			numericField.isVisible = false
				display.lostGame = display.newText("Sorry, you lost!", display.contentWidth/2, display.contentHeight/2, nil, 75)
    			display.lostGame:setTextColor(255/255, 102/255, 102/255)
				lostGameSoundChannel = audio.play(lostGameSound)

			end
		end

		-- clear text field
		event.target.text = ""

    	if (correctPoints == 5) then
			correctObject.isVisible = false

    		--play the sound on any available channel
			--winGameSoundChannel = audio.play(winGameSound)

			
			wonGameSoundChannel = audio.play(wonGameSound)


			-- add text that say end game
			display.wonGame = display.newText("Yay, you won!", display.contentWidth/2, display.contentHeight/2, nil, 75)
    		display.wonGame:setTextColor(255/255, 102/255, 102/255)	   
			
    		incorrectPointsText.isVisible = false
    		correctPointsText.isVisible = false
    		correctObject.isVisible = false
    		incorrectObject.isVisible = false
    		questionObject.isVisible = false
    		numericField.isVisible = false 
    		heart1.isVisible = false
    		heart2.isVisible = false
    		heart3.isVisible = false
    		clockText.isVisible = false
		end
	end
end



-----------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION 
-----------------------------------------------------------------------------------------------------------------------------

-- display timer on screen
clockText = display.newText("", 100, 100, nil, 50)

-- create the lives to display on the screen 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 5 / 8
heart1.y = display.contentHeight * 1 / 7 

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 7 / 8
heart2.y = display.contentHeight* 1 / 7 

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 6 / 8
heart3.y = display.contentHeight * 1 / 7

-----------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
correctPointsText = display.newText("Points = " .. correctPoints, 200, 200, nil, 50)
correctPointsText:setTextColor(178/255, 102/255, 255/255)

-- display the amount of points as a text object
incorrectPointsText = display.newText(" ", 800, 200, nil, 50)
incorrectPointsText:setTextColor(178/255, 102/255, 255/255)
--------------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------------

-- call the function to ask the question and to start timer
AskQuestion()
StartTimer()