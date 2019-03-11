local composer = require( "composer" )
 
local scene = composer.newScene()
 

 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
       
 
    elseif ( phase == "did" ) then

   ---Game Main code ---------------------------------------------------------------
    

    display.setStatusBar(display.HiddenStatusBar)

            ---- Main constants

        CSX = display.contentCenterX
        CSY = display.contentCenterY
        CH = display.contentHeight
        CW = display.contentWidth

            ----- Creating groups

        local needles = display.newGroup()
        local platforms = display.newGroup()

          ---- Fone Music ON

         -- local BcgSound = audio.loadSound( "bcgm.mp3" )
         -- local playBcgSound = audio.play( BcgSound )


          --- Main object

        local ballon = display.newCircle(  CSX, CSY , 85 )


        ----Platfor Group objects

        local platform_1 = display.newRect( platforms, CSX , CSY + (CH/2),  CW*2, 100 )
        local platform_2 = display.newRect( platforms, CSX , CSY - (CH/2) ,  CW*2, 100 )


        --[[ 

                GAME NEEDS ADAPTIVITING

                {{there are  error with platforms width}}
       
        --]]


        --- ADD physics
        local physics = require("physics")
        physics.start()
        physics.setGravity( 0, 9.8 )

        physics.addBody( ballon )
        physics.addBody(platform_1, "static")
        physics.addBody(platform_2, "static")


    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
       
 
    elseif ( phase == "did" ) then
       
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
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