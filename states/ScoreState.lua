--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    self.bronze_image = love.graphics.newImage('/TROPHIES/bronze.png')
    self.silver_image = love.graphics.newImage('/TROPHIES/silver.png')
    self.gold_image = love.graphics.newImage('TROPHIES/gold.png') 
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    play = false
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
      
        gStateMachine:change('countdown')

    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    if self.score < 2 then
        love.graphics.setFont(flappyFont)
        love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
    
        love.graphics.setFont(mediumFont)
        love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(awardsFont)
        love.graphics.setColor(0,0,0,255)
        love.graphics.print('        WINNING POINTS   ', VIRTUAL_WIDTH-150, 80)
        love.graphics.print('    SCORE           REWARD', VIRTUAL_WIDTH-150, 100)
        love.graphics.print('     2-4            Bronze', VIRTUAL_WIDTH-150, 120)
        love.graphics.print('     5-7            Silver', VIRTUAL_WIDTH-150, 140)
        love.graphics.print('greater than 7      Gold', VIRTUAL_WIDTH-150, 160)
        love.graphics.setColor(255,255,255,1)
    
    elseif self.score >= 2 and self.score <= 4 then
        love.graphics.setColor(0,0,0,1)
        love.graphics.print('YOU WON!!!',50,50)
        
        love.graphics.setFont(mediumFont)
        love.graphics.print('Score: ' .. tostring(self.score),50, 100)
        love.graphics.setColor(255,255,255,1)  
        love.graphics.draw(self.bronze_image,VIRTUAL_WIDTH/2 - 40,VIRTUAL_HEIGHT/2 - 140)
        love.graphics.print('BRONZE',VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2-20)
    elseif self.score > 4 and self.score <=6 then
        love.graphics.setColor(0,0,0,1) 
        love.graphics.print('YOU WON!!!',50,50)
      
        love.graphics.setFont(mediumFont)
        love.graphics.print('Score: ' .. tostring(self.score),50, 100)
        love.graphics.setColor(255,255,255,1) 
        love.graphics.draw(self.silver_image,VIRTUAL_WIDTH/2-40, VIRTUAL_HEIGHT/2 - 140) 
        love.graphics.print('SILVER',VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2-20)
    elseif self.score >=   7 then 
        love.graphics.setColor(0,0,0,1)
        love.graphics.print('YOU WON!!!',50,50)
    
        love.graphics.setFont(mediumFont)
        love.graphics.print('Score: ' .. tostring(self.score),50, 100)
        love.graphics.setColor(255,255,255,1)  
        love.graphics.draw(self.gold_image,VIRTUAL_WIDTH/2 - 40,VIRTUAL_HEIGHT/2 - 140) 
        love.graphics.print('GOLD',VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2-20) 
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end