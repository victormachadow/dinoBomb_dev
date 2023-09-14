local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()
--local options = { level="Level 1" }
local options = { level=1 , dificult="" , numTeam1 =" player numebers" , numTeam2 , teamSide=" esq or right " , myCaracter ="" , }
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


function changeScene(event)

   if ( "ended" == event.phase ) then

--[[
--print(event.target.id)
if(event.target.id=="button1")then
    options["level"] = " level 1 "
composer.gotoScene( "battle" , { effect="fade", time=800  , params = options } )
composer.removeScene( "menugame" )
                         end

if(event.target.id=="button2")then
     options["level"] = " level 2 "
composer.gotoScene( "battle" , { effect="fade", time=800  , params = options } )
composer.removeScene( "menugame" )
                         end

--]]


  composer.gotoScene( "levelBattle" , { effect="crossFade", time=2800  , params = options } )
  composer.removeScene( "menugame" )
                         
   
    end



end


  

local function sliderListener(event)

print( (event.value*400)/100)
--print( event.value )


end 

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

local bkg = display.newImage( "bg2.jpg", centerX, centerY ) 

bkg.alpha=0.2
sceneGroup:insert(bkg)

local slider = widget.newSlider(


 {

 width = 400 ,
 value = 50  , 
 listener = sliderListener 


}



)
slider.x = centerX
slider.y = 350
sceneGroup:insert(slider)

local segEn = widget.newSegmentedControl(

{


segmentWidth = 150 ,
segments = { " 1 " , " 2 " ,  " 3 " }


}


)


segEn.x = centerX
segEn.y = 50

sceneGroup:insert(segEn)

local textEn = display.newText( " Number of enemies : ", 100 , segEn.y , native.systemFontBold, 16 )
textEn:setFillColor("black")
sceneGroup:insert(textEn)

local segFr = widget.newSegmentedControl(

{


segmentWidth = 150 ,
segments = { "none " , " 1 " , " 2 " ,  " 3 " }


}



)

segFr.x = centerX 
segFr.y = 150

sceneGroup:insert(segFr)

local textFr = display.newText( " Number of friends : ", 100 , segFr.y , native.systemFontBold, 16 )
textFr:setFillColor("white")
sceneGroup:insert(textFr)

local segDificult = widget.newSegmentedControl(

{


segmentWidth = 150 ,
segments = { " Begginer " , " Average " , " Hard " ,  " Ninja " }


}



)

segDificult.x = centerX 
segDificult.y = 250

sceneGroup:insert(segDificult)

local textDif = display.newText( " Dificulty : ", 100 , segDificult.y , native.systemFontBold, 16 )
textDif:setFillColor("black")
sceneGroup:insert(textDif)



local bt = widget.newButton(
{   
    defaultFile = "buttonYellow.png",
    overFile = "buttonYellowOver.png",
    label = " Jogar ",
    emboss = true ,
    onEvent = changeScene
}
)


bt.x , bt.y = centerX , 450

sceneGroup:insert(bt)


end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

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