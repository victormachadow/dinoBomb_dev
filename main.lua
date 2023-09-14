local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight


local composer = require( "composer" )

local scene = composer.newScene()


local options =
{
    effect = "fade",
    time = 1000
  
}


composer.gotoScene( "menugame" , { effect="fade", time=1800 } )