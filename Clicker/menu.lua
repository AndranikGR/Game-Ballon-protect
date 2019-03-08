


local composer = require( "composer" )
 
local scene = composer.newScene()
 
function scene:create( event )
 
    local sceneGroup = self.view
    
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        
 
    elseif ( phase == "did" ) then

    -- Runs menu code 
        display.setStatusBar( display.HiddenStatusBar)

            local start = display.newText("Start Game", display.contentCenterX,display.contentCenterY, native.systemFont, 170)
        -- On click to "Start Game function"
            function GoToGame()
                composer.gotoScene("Game")

            end
-- Event listener
            start:addEventListener("touch", GoToGame )


            local scoreText = display.newText("Your Score", display.contentCenterX,display.contentCenterY + 500, native.systemFontn, 140)
            --local score = display.newText(TapFinal, display.contentCenterX,display.contentCenterY + 250, native.systemFontn, 40)
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end

end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene