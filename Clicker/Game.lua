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

    ---------------------Math--------------
    local Math = require("math")

            ---- Main constants

        CSX = display.contentCenterX
        CSY = display.contentCenterY
        CH = display.contentHeight
        CW = display.contentWidth

            -----Game Constnts---
        score = 0


            ----- Creating groups

       --- local enemyes = display.newGroup()
        local platforms = display.newGroup()

          ---- Fone Music ON

         -- local BcgSound = audio.loadSound( "bcgm.mp3" )
         -- local playBcgSound = audio.play( BcgSound )

        ------------------------DRAWING----------------------
        local ScoreText = display.newText(score, 100 , 0, native.systemFont, 100)
          --- Main object
        local ballon_1 = display.newCircle(  CSX, CSY , 80 )
        local ballon_2 = display.newCircle(  CSX, CSY , 80 )
        local bacground = display.newRect( platforms, CSX , CSY ,  CW*2, CH*2 )
        local enmRect = display.newRect(0, CSY,100, 40)
       

        ----Platfor Group objects

        local platform_1 = display.newRect( platforms, CSX , CSY + (CH/2),  CW*2, 100 )
        local platform_2 = display.newRect( platforms, CSX , CSY - (CH/2) ,  CW*2, 100 )

        ---SET COLORS
        bacground:setFillColor(0,0,0)
        enmRect:setFillColor(math.random(0.4,1),math.random(0, 0.6),math.random(0.4,1))
        ScoreText:setFillColor(0,0,0)

        --[[ 

                GAME NEEDS ADAPTIVITING

                {{there are  error with platforms width}}
       
        --]]


        --- ADD physics
        local physics = require("physics")
        physics.start()
       
        physics.setGravity(0, 0 )

        physics.addBody(ballon_1, "dinamic")
        physics.addBody(ballon_2, "static")
        physics.addBody(enmRect, "static")
        physics.addBody(platform_1, "static")
        physics.addBody(platform_2, "static")
        
        -----------------------------------ANIMATIONS-------------------------------------------
        transition.moveTo(enmRect, {x = CSX + CW/2 + 50, time = 2400, tag = "EnmTransform"})
        
    -----Ballon animation----------------------
    

        transition.moveTo( ballon_1, {x = CSX, y = (CSY + (CH/2)) - 125, time = 500} )
        transition.moveTo(ballon_2, {x = CSX, y = (CSY - (CH/2)) + 125, time = 500 })
        function OnClick(e)
            if(e.phase == "began")then   
                transition.moveTo( ballon_1, { x = CSX, y = CSY + 80, time = 30})
                transition.moveTo(ballon_2, {y = CSY - 90, time = 30 })
                
                
                
               function InWin(event)
                    if(event.phase == "began")then
                        score = score + 1 
                        ScoreText.text = score
        
                    end
                    if(event.phase == "ended")then
                        transition.pause(EnmTransform)
                        transition.moveTo(enmRect,{x = CSX - CW/4, y = CSY * 5, time = 0.111 })     
                     end
                end
               
                enmRect:addEventListener("collision", InWin)
               
            end
            if(e.phase == "ended")then
                transition.moveTo( ballon_1, { y = (CSY + (CH/2)) - 125, time = 500} )
                transition.moveTo(ballon_2, {y = (CSY - (CH/2)) + 125, time = 500 })
            end
           
        end
        
       
        
    -------------------#############################LOGIC#######################-------------------------
    
   
    
-----------------------------------EVENTS---------------------------------
   
    bacground:addEventListener("touch", OnClick)
    
    

--------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------
 ----------------------------Game Code end--------------------------------------------
 -------------------------------------------------------------------------------------------
 -------------------------------------------------------------------------------------- 
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