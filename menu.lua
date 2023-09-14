local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--local options = { level="Level 1" }
local options = { level=1 , dificult="" , numTeam1 =" player numebers" , numTeam2 , teamSide=" esq or right " , myCaracter ="" , }
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


function changeScene(event)

   if ( "ended" == event.phase ) then

--print(event.target.id)
if(event.target.id=="button1")then
    options["level"] = " level 1 "
composer.gotoScene( "battle" , { effect="fade", time=800  , params = options } )
composer.removeScene( "menu" )
                         end

if(event.target.id=="button2")then
     options["level"] = " level 2 "
composer.gotoScene( "battle" , { effect="fade", time=800  , params = options } )
composer.removeScene( "menu" )
                         end


   
    end



end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

   
local oneBt = widget.newButton(
    {
        width =  200,
        height = 200,
        id = "button1",
        label = " 1 PLAYER ",
        fontSize = 100 ,
        --onRelease = changeScene
        onEvent = changeScene
    } )


oneBt.x = centerX
oneBt.y = centerY-100


--sceneGroup:insert(oneBt)

local secBt = widget.newButton(
    {
        width =  200,
        height = 200,
        id = "button2",
        label = " 2 PLAYER ",
        fontSize = 100 ,
        --onRelease = changeScene
        onEvent = changeScene
    } )


secBt.x = centerX
secBt.y = centerY+100

--sceneGroup:insert(secBt)

local segmentedCtrl = widget.newSegmentedControl(

{

left = 50,
top=150,
segmentWidth = 150,
segments = { " 1 " , " 2 " ,  " 3 " }


}

)


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