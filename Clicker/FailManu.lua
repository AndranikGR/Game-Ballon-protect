


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
        --- Menu objects

        local GameOver = display.newText("Game Over!", display.contentCenterX,display.contentCenterY - 200, native.systemFont, 140)
        local RestartButton = display.newText("Restart", display.contentCenterX, (display.contentCenterY - 200) + 600, native.systemFont, 140)
        local MenuButton = display.newText("Back to manu",display.contentCenterX, (display.contentCenterY - 200) + 800, native.systemFont, 140 )

        ----------------MANU LOGIC --------------------------------
        function RestartButtonClikc()
            composer.gotoScene("Game")
            GameOver:removeSelf()
            RestartButton:removeSelf()
            MenuButton:removeSelf()
        end
        function BackToManuClick()
            composer.gotoScene("menu")
            GameOver:removeSelf()
            RestartButton:removeSelf()
            MenuButton:removeSelf()
        end
----------------------EVENTS--------------------------------------
        RestartButton:addEventListener("touch", RestartButtonClikc )
        MenuButton:addEventListener("touch", BackToManuClick )
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
   

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