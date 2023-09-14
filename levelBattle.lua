
                                                 --------------------- BATTLE MODE --------------------



local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local composer = require( "composer" )
local scene = composer.newScene()

local physics = require("physics")
local persons = require("persons")
local widget = require( "widget" )

physics.start()
--physics.setDrawMode( "hybrid" )
physics.setGravity(0,20)
local Trajectory = require( "dmc_library.dmc_trajectory" )

deltasX = { 0.1 , 0.2 , 0.3 , 0.4 , 0.5 }
deltasY = { 0.5 , 0.6 , 0.7 , 0.8 , 0.9 , 1.0 }

defaultSide = 1


local flagTouchPlayer = false
inTarget=false
target = _W-100
local engage = false

local fr

local aleatory = 20
local avoidance = 70

--local bkg = display.newImage( "background11.png", centerX, centerY )

 

--local d = display.newImage( "duck-02.png", centerX-200, centerY+180 ) 



local bullet

local sprites2
local lifeBars = {}
local damageBars = {}
local playerBar
local spritesEn = {} 
local player , playerBar , damagePlayer , sprites , texTime
local bkg , borderBottom , middleBottom , borderLeft , borderTop1 , borderRight


local sceneGroup = display.newGroup() 
--groupEn = display.newGroup()
groupEn = {}
groupFriend = display.newGroup()

local bulletEn
local bullets = display.newGroup()
local bulletFr = display.newGroup()

local timersAtack = {}
local timersMove = {}
local texTime
local upt
local up
local cont = 0 
local game = true

local timerT
--local t1
--local t2
--local t3
local timers = { t1 , t2 , t3 }

local options = { numFriends = 0 , numEn = 3 , dificult = 10 ,  side = "esq" , arrows = false , en1 = "green" , en2 = "green" , en3 = "green" , hpe = 10 }
-- Aqui vem as informações do menu
--print(itens[999])
local numEn = options["numEn"]
local life = options["hpe"]
local numFriends = options["numFriends"]

--[[

n=math.random(0,100)
if( n > 10 )then  




]]


-- Criação dos bagulho
--------------------------------------x--------------------------------------------

function changeScene()

timer.cancel(up2)
composer.gotoScene( "menugame" , { effect="crossFade", time=2800  , params = options } )
composer.removeScene( "levelBattle" )


 end 


function showRestart()

  resButton = widget.newButton
{
  left = 380,
  top = 350,
  width = 340,
  height = 50,
  id = "button1",
  defaultFile = "buttonYellow.png",
  overFile = "buttonYellowOver.png",
  label = "Back to Menu",
  fontSize = 34,
  onRelease = changeScene
}
 resButton.x = centerX
 resButton.y = centerY - 50
 resButton.alpha = 0 
 
  sceneGroup:insert(resButton)
  transition.to(resButton,{ y = resButton.y , time=2000, alpha=1})
 
end



 local sheetPato =
{
    width = 100,
    height = 100,
    numFrames = 4,
    sheetContentWidth = 400,  --width of original 1x size of entire sheet
    sheetContentHeight = 100
}

local sheetBomb =  {
   
    width =  64,
    height = 64,
    numFrames = 25,
    sheetContentWidth = 320,  --width of original 1x size of entire sheet
    sheetContentHeight = 320



}


 local sequencesPato = {
    -- first sequence (consecutive frames)
    
        name = "normalRun",
        start = 1,
        count = 4,
        --loopCount=-1, -- seta quantidade de vezes q ele ira executar
        time = 800,
       
    }


 local sequencesBomb = {
    -- first sequence (consecutive frames)
    
        name = "normalRun",
        start = 1,
        count = 25,
        loopCount = 1, -- seta quantidade de vezes q ele ira executar
        time = 800,
       
    }


local sheet = graphics.newImageSheet( "SS_duck_80_i.png", sheetPato )

local sheet2 = graphics.newImageSheet( "SS_duck_80.png", sheetPato )

local sheet3 = graphics.newImageSheet( "ex2.png", sheetBomb )




---------------- GAME FUNCTIONS ------------------------------


local function onLocalCollision2( self, event )
     -- Aqui ele popula o array quando a bola toca o chao ou o player
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )
local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()

    display.remove(self)



end
       
if(event.other.myName=="player")then

   

local ex = display.newSprite( sheet3 , sequencesBomb )


ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()
  
 
  player.hp = player.hp -1
  damagePlayer.width = 10 * (5 - player.hp)
                
        display.remove(self) 

      end 

  if(event.other.myName=="enemy")then
        en = event.other
        en.hp = en.hp - 1

local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()

 en.dmg.width = 5 * (10 - en.hp)

        display.remove(self)

  end






 if(event.other.myName=="trave")then
        
       Trajectory.setFlag2(false) 
       --print(Trajectory.flag()) -- Acessando a variável em outro modulo
       --display.remove(self)
       --Runtime:removeEventListener( positionIterator )

  end  



end
end




 local function onLocalCollision3( self, event )
     -- Aqui ele popula o array quando a bola toca o chao ou o player
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )
local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()


    display.remove(self)

end
       
if(event.other.myName=="player")then

       player.hp = player.hp -1

local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()

damagePlayer.width = 10 * (5 - player.hp)

        display.remove(self) 

      end 

  if(event.other.myName=="enemy")then
        en = event.other
        en.hp = en.hp - 1

local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()


en.dmg.width = 5 * (10 - en.hp)

        display.remove(self)

  end 


 if(event.other.myName=="trave")then
        
       Trajectory.setFlag3(false) 
       --print(Trajectory.flag2()) -- Acessando a variável em outro modulo
       --display.remove(self)
       --Runtime:removeEventListener( positionIterator )

  end  



end
end





 local function onLocalCollision( self, event )
     
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )
local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()


display.remove(self)


end

  if(event.other.myName=="player")then

       

local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()

if( game == true )then  -- Se estiver em jogo as bombas darao dano no player, fora do jogo na surtirão efeito..
 player.hp = player.hp -1
 damagePlayer.width = 10 * (5 - player.hp)
end
        display.remove(self) 



      end 

 if(event.other.myName=="enemy")then
        en = event.other
        en.hp = en.hp - 1

local ex = display.newSprite( sheet3 , sequencesBomb )
ex.isVisible=true
ex.x = self.x
ex.y = self.y
ex:play()

en.dmg.width = 5 * (10 - en.hp)

        display.remove(self)

  end 

  if ( event.other.myName =="trave")then

        Trajectory.setFlag(false) 

  end


end

end


local function getTimer(v)

return v.timer

 end 



local function tapa( event )

if ( event.phase=="began"  ) then

  

 if ( event.x < player.x )then
 
 esq = true

  
 

 player:setLinearVelocity( -300 ,0)
 --player:applyLinearImpulse( -0.3 , 0 ,  player.x , player.y )
                              
  end
 
 if ( event.x > player.x )then
 

 esq = false


 player:setLinearVelocity( 300 ,0)
 --player:applyLinearImpulse( 0.3 , 0 ,  player.x , player.y )
                                
  end

   


 end


 end







local function shot( event )
  
bkg:removeEventListener("touch" , tapa )
  player:setLinearVelocity(0,0)

  local phase = event.phase

    
  if "began" == phase then
num = 1  
    display.getCurrentStage():setFocus(player)
    player:setLinearVelocity(0,0)

     print("began")
   
    player.isFocus = true
    
    

  myLine = nil
  
  myLine = display.newLine( player.x,player.y, player.x , player.y+20)
      myLine:setStrokeColor(0.1, 0.2, 0.3)
      myLine.strokeWidth = 20
      myLine.alpha=0.8

  elseif player.isFocus then
     
    if "moved" == phase then
    num = num + 2   

  
  print("moved")  
    display.getCurrentStage():setFocus(player)
    player:setLinearVelocity(0,0)
    
      
      if ( myLine ) then
       -- myLine.parent:remove( myLine ) -- erase previous line, if any
        display.remove(myLine)
      end 
  
      myLine = display.newLine( player.x, player.y, event.x,event.y)
      myLine:setStrokeColor(0.1, 0.2, 0.3)
      myLine.strokeWidth = 20
      myLine.alpha=0.8

    elseif "ended" == phase then
    
bkg:addEventListener("touch" , tapa )
--print(num)
 
deltaX = event.x - player.x
deltaY = event.y - player.y
normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
      
    
      display.getCurrentStage():setFocus( nil )
      --player.isFocus = false
  
      if ( myLine ) then
        --myLine.parent:remove( myLine )
        display.remove(myLine)
      end
 if ( num > 5 )then
    bullet = display.newCircle( 0 , 0, 15 )
    bullet.x = player.x
    bullet.y = player.y-50
    
  if ( deltaY < -10 ) then bullet.y = player.y+50 end


  bullet.collision = onLocalCollision
  bullet:addEventListener( "collision", bullet )
  --bullet.myName="shoot"


    physics.addBody( bullet )
    bulletFr:insert(bullet)
    sceneGroup:insert(bullet)  
 

 bullet:applyLinearImpulse(((event.xStart - event.x)/200) , ((event.yStart - event.y)/200 ) , bullet.x , bullet.y )

end
 display.getCurrentStage():setFocus(nil)


    end
  end

  --return true -- Stop further propagation of touch event
end

--[[
320x320

]]




function hasBullet()

for j=groupEn.numChildren,1,-1 do
for i=bulletFr.numChildren,1, -1 do 

if( groupEn[j] ~= nil ) then 

if (bulletFr[i].x > _W/2) then

if(bulletFr[i].y>250)then

if(bulletFr[i].x > groupEn[j].x )then

--en:setLinearVelocity( math.random( 100, 500)*-1, 0 )
groupEn[j]:setLinearVelocity( math.random( 100, 500)*-1, 0 )
timer.performWithDelay( 500 , function()

groupEn[j]:setLinearVelocity( math.random( 50, 100 ), 0 )

  end , 1 )
--n = math.random(0,10)
--if(math.random(0,10) > 7 )then en:setLinearVelocity(math.random(100,500) , 0 ) end


 end 

if(bulletFr[i].x<en.x)then
 --en:applyLinearImpulse(0.1 ,0)
 --en:setLinearVelocity(math.random(100,500) , 0 )
 groupEn[j]:setLinearVelocity( math.random( 100, 500), 0 )
timer.performWithDelay( 500 , function()

groupEn[j]:setLinearVelocity( math.random( 50, 100) * -1 , 0 )

  end , 1 )

--if(math.random(0,10) > 7 )then en:setLinearVelocity(math.random(100,500)*-1 , 0 ) end


 end 



 end 



end


end -- end do if do nil

end -- end do 2 for

end -- end do 1 for

end




function atack22()

--deltaX = player.x - en.x
--deltaY = math.random(0,5) - player.y
deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1
--deltaY = math.random(0,90) - player.y
--n= math.random(0,100)

--if ( n < aleatory ) then
--anda(getObj(2))

--end
--[[



A = vo² * sen20 / g
Ag = vo² * sen20
vo² = Ag/sen20
vo = sqrt( A*g/sen2angle)

gravity = 0.20
distance = en.x - player.x
angle = 10

v0 = (1 / math.cos(angle)) * math.sqrt((0.5 * gravity * math.pow(distance, 2)) )

v01 = v0 / (distance * math.tan(angle)  )

bulletEn:applyLinearImpulse( v01 * math.cos(angle) , v01 * math.sin(angle) , bulletEn.x , bulletEn.y )


]]

if ( getObj(2) ~= nil )then

normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    --filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(2).x
    bulletEn.y = getObj(2).y-80

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(2).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  
--[[
if(player.x > _W/2 - 80 )then

Trajectory.move2( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-70 , 10 }, height=150, rotate= false})

else
--]]
Trajectory.move2( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})



--Trajectory.move2( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})

--Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-30 , 5 }, height=150, rotate= false})

-- FAZ UM MONTE DE CALCULO AÍ E NAO DA CERTO


 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )

end

end

function atack3()

deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1


if(getObj(3) ~= nil )then

normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    --filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(3).x
    bulletEn.y = getObj(3).y-80

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(3).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  

--[[
if(player.x > _W/2 - 80 )then

Trajectory.move3( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-70 , 10 }, height=150, rotate= false})

else

--]]

Trajectory.move3( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})




--Trajectory.move3( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})

--Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-30 , 5 }, height=150, rotate= false})

-- FAZ UM MONTE DE CALCULO AÍ E NAO DA CERTO


 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )

end

end




function atack()


deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1


if ( getObj(1) ~= nil )then

normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    --filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(1).x
    bulletEn.y = getObj(1).y-80

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(1).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  

--[[
if(player.x > _W/2 - 80 )then

Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-70 , 10 }, height=150, rotate= false})

else
--]]

Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})





--Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=250, rotate= false})

--Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-30 , 5 }, height=150, rotate= false})

-- FAZ UM MONTE DE CALCULO AÍ E NAO DA CERTO


 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )

end

end


function atackEn2()

--deltaX = player.x - en.x
--deltaY = math.random(0,5) - player.y
deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1
--deltaY = math.random(0,90) - player.y


normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = en2.x
    bulletEn.y = en2.y-50

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = en2.x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , { filter = filterBall } )
    bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  
 

 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )
 Trajectory.move2( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )


end


function ataca(nx , ny)
if(atacando==false)then
  atacando = true
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = en.x
    bulletEn.y = en.y-50

   
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn )
    bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  
 
 --print("nx :"..nx)
 --print("ny :"..ny)
 bulletEn:applyLinearImpulse(((nx * 30)/100)  , ((ny * 30 )/100 )  , bulletEn.x , bulletEn.y )
 
--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )
timer.performWithDelay( 5000 , function()


atacando = false

  end, 1 )


end




end








function getTarget()


if(en.x <= target)then
 target = _W/2+50
end
if(en.x >= target)then
 target = _W -100
end



--target = math.random( _W/2+50, _W-100)
--inTarget = true -- Ele estará intarget e não terá o fluxo interrompido



end






function go()


transition.moveTo( en, { x= target, y=en.y, time=math.random(1000,2000) , onComplete=atack() } )


end



function go1()

if ( getObj(1) ~= nil  ) then

en1 = getObj(1)

if(player.x > _W/2-80 )then


transition.moveTo( en1, { x = _W/2 + 50 ,  y=en1.y, time=math.random(1000,1500) , onComplete=function()

--normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
--normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

   
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(1).x
    bulletEn.y = getObj(1).y-80

    --bulletEn.normX = normDeltaX
    --bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(1).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)

bulletEn:applyLinearImpulse( -0.1 , -0.5 , bulletEn.x , bulletEn.y )

end } )

 else 
transition.moveTo( en1, { x = math.random(_W/2 + 50 , _W -50 ), y=en1.y, time=math.random(1000,2000) , onComplete=atack() } )

end


end -- end do nil

end


function go2() 

if ( getObj(2) ~= nil ) then

en2 = getObj(2)

if(player.x > _W/2-80 )then


transition.moveTo( en2, { x = _W/2 + 50 ,  y=en2.y, time=math.random(1000,1500) , onComplete=function()

--normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
--normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

   
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(2).x
    bulletEn.y = getObj(2).y-80

    --bulletEn.normX = normDeltaX
    --bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(2).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)

bulletEn:applyLinearImpulse( -0.1 , -0.5 , bulletEn.x , bulletEn.y )


end } )

 else 


transition.moveTo( en2 , { x= math.random(_W/2 + 50 , _W -50 ), y=en2.y, time=math.random(1000,2000) , onComplete=atack22() } )

end -- end do nil

end
end


function go3()

if ( getObj(3) ~= nil ) then


en3 = getObj(3)
if(player.x > _W/2-80 )then


transition.moveTo( en3, { x = _W/2 + 50 ,  y=en3.y, time=math.random(1000,1500) , onComplete=function()

--normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
--normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

   
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = getObj(3).x
    bulletEn.y = getObj(3).y-80

    --bulletEn.normX = normDeltaX
    --bulletEn.normY = normDeltaY
    bulletEn.targetX = getObj(3).x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)

bulletEn:applyLinearImpulse( -0.1 , -0.5 , bulletEn.x , bulletEn.y )


end } )

 else 

transition.moveTo( en3 , { x = math.random(_W/2 + 50 , _W -50 ), y=en3.y, time=math.random(1000,2000) , onComplete=atack3 } )

end

end -- end do nil

end




function respawn()

 bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = player.x
    bulletEn.y = 200

   
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn )
    bullets:insert(bulletEn)



 end 

function anda(obj)

--[[
n = math.random(0,10)

if( n <= 5 )then

obj:setLinearVelocity( math.random(100 , 150) , 0 )

 end 


if( n > 5 )then

obj:setLinearVelocity( math.random(100 , 150) * -1 , 0 )

 end 

--]]


for i = groupEn.numChildren, 1 , -1 do 
if(obj ~= groupEn[i])then
if( obj.x - groupEn[i].x < 40)then

obj:setLinearVelocity(math.random(150,300), 0 )


end

if( obj.x - groupEn[i].x < -40)then

obj:setLinearVelocity(math.random(150,300) * -1 , 0 )


end


end

end


--transition.moveTo( obj , { x = math.random( _W/2 , _W/2+400 ) , y = obj.y, time=math.random(700,1500) } )


 end

function update2()

sprites.x=player.x
sprites.y=player.y

damagePlayer.x=player.x
damagePlayer.y=player.y-30
playerBar.x=player.x
playerBar.y=player.y-30


end


function update( event )
--mapeia()
playerHp.text="player hp:  "..player.hp
--enHp.text="enemy hp:  "..en.hp


--timer.performWithDelay( math.random(2100,2700), hasBullet , 1 )
--timer.performWithDelay( 2000 , hasBullet , 1 ) -- checa onde tem bala

 


for i=1 , numEn , 1 do


if( groupEn[i] == nil )then

 timer.cancel(timers[i])

 end 
end

--for i = groupEn.numChildren, 1 , -1 do 
  --for k , v in pairs ( groupEn ) do
    for i = 1 , numEn , 1 do
       v = groupEn[i]    
        --[[   spritesEn[i].x = groupEn[i].x
           spritesEn[i].y = groupEn[i].y

           lifeBars[i].x = groupEn[i].x
           lifeBars[i].y = groupEn[i].y-30

           groupEn[i].dmg.x = groupEn[i].x
           groupEn[i].dmg.y = groupEn[i].y-30

          if ( groupEn[i].hp < 0 ) then
            
         display.remove(groupEn[i].dmg )
         display.remove(groupEn[i])
         display.remove( spritesEn[i])
         display.remove(lifeBars[i])
         
         groupEn[i] = nil

         --spritesEn[i] = nil
         --lifeBars[i]= nil
         print( groupEn.numChildren )

          
          end
--]]
if( v ~= nil and v.lifeBar ~= nil and v.dmg ~= nil and v.sprit ~= nil ) then

 v.sprit.x = v.x
 v.sprit.y = v.y

  v.lifeBar.x = v.x 
  v.lifeBar.y = v.y - 30

  v.dmg.x = v.x
  v.dmg.y = v.y - 30

--t = getTimer(v)

  if ( v.hp < 0 ) then
            
         timer.cancel( timers[i] )   
         display.remove(v.dmg )
         display.remove(v.sprit)
         display.remove(v.lifeBar)

         v.dmg=nil
         v.sprit=nil
         v.lifeBar=nil
         
         
           display.remove(v)
           v = nil
           cont = cont + 1
           print(v)
           
         --spritesEn[i] = nil
         --lifeBars[i]= nil
       

          
          end
end


 


         end


 if ( cont >= numEn ) then   
   
game = false
timer.cancel(event.source)
timer.cancel(upt)
timer.performWithDelay( 3000 , showRestart , 1 )       


  end

  if( player.hp <= 0 )then


  game = false

timer.cancel(event.source)
timer.cancel(upt)

for i = 1 , numEn , 1 do
timer.cancel( timers[i] )
display.remove(groupEn[i])
groupEn[i]=nil
end 

timer.performWithDelay( 3000 , showRestart , 1 ) 



   end 



--hasBullet()

end




function targets(nm)
--print(nm)
n = math.random(0,5)
if( n > 2 )then inTarget = true end
if( n < 2 )then inTarget = false end
--print(inTarget)

end


function move3()

if ( math.random(0,10) > 5 ) then en:setLinearVelocity(-10,0) end
if ( math.random(0,10) < 5 ) then en:setLinearVelocity( 10,0) end

 end 



function move2()

transition.moveTo( en2, { x= math.random(_W/2+40 , _W-40 ), y=en2.y, time=math.random(500,1000) , onComplete=move } )

 end 

function move()

transition.moveTo( en, { x= math.random(_W/2+40 , _W-40 ), y=en.y, time=math.random(500,1000) , onComplete=move2 } )

 end 



function getObj(numb)

--for i = groupEn.numChildren, 1 , -1 do 
for k , v in pairs(groupEn) do
        if ( v ~= nil) then   
          obj = v
           if ( obj.id == numb )then
           --break
           return obj
         end
           --timer.performWithDelay( 1500 , atack( obj ) , -1 )
        
        end
          end
    
 return obj

end


local updateTimer = function()
  
    seconds1 = math.random( 2000 , 3500 )
    seconds2 = math.random( 2000 , 3000 )
    seconds3 = math.random( 2000 , 3000 )
    for k , v in pairs(timers) do
    v._delay = seconds1  -- This is the solution!
    --t2._delay = seconds2  -- This is the solution!
    --t3._delay = seconds3  -- This is the solution!
    --print(player.x)   
    end

end



function time( event )
  
  local count = event.count
--print(count)
print( "Table listener called " .. count .. " time(s)" )
  texTime.text = count

  if count >= 5 then
    timer.cancel( event.source ) -- after the 20th iteration, cancel timer

    timer.performWithDelay(1 , update , -1)
    player:addEventListener("touch",shot)
    bkg:addEventListener("touch" , tapa )

--obj1= getObj(1)
--obj2= getObj(2)
--obj3= getObj(3)
--t1 = timer.performWithDelay( 1500 , atack , -1 )
--t2 = timer.performWithDelay( 1500 , atack22 , -1 )
--t3 = timer.performWithDelay( 1500 , atack3 , -1 )
if(numEn==3)then
timers[1] = timer.performWithDelay( 800 , go1 , -1 )
timers[2] = timer.performWithDelay( 1500 , go2 , -1 )
timers[3] = timer.performWithDelay( 1000 , go3 , -1 )
end

if(numEn==2)then
timers[1] = timer.performWithDelay( 1000 , go1 , -1 )
timers[2] = timer.performWithDelay( 1500 , go2 , -1 )

end


if(numEn==1)then
timers[1] = timer.performWithDelay( 1500 , go1 , -1 )

end




up = timer.performWithDelay( 1 , update , -1 )
up2 = timer.performWithDelay( 1 , update2 , -1 )
upt = timer.performWithDelay( 5000 , updateTimer , -1 )

--timer.performWithDelay( 1500 , atack(obj1) , -1 )
--timer.performWithDelay( 1500 , atack22(obj2) , -1 )
--timer.performWithDelay( 1500 , atack(obj3) , -1 ) 
    -- AQUI VAI COMEÇAR A LEITURA E ANALISE DO JSON PARA CRIAR OS TIMERS DOS JOGADORES
  
 
       
    display.remove(texTime)
    
  end

  
  end






-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

  
 sceneGroup = self.view

bkg = display.newImage( "backg.jpg", centerX, centerY )   

sceneGroup:insert(bkg)


 borderBottom = display.newRect( 0, 550, _W*2, 20 )
borderBottom:setFillColor( 1, 1, 1, 1)    -- make invisible
physics.addBody( borderBottom, "static", borderBodyElement )
borderBottom.myName="chao"
borderBottom.collision=onLocalCollision

sceneGroup:insert(borderBottom)

-- local bkg , borderBottom , middleBottom , borderLeft , borderTop1 , borderRight

 middleBottom = display.newRect( _W/2, _H+10, 20, 600 )
middleBottom:setFillColor( 1, 1, 1, 1)    -- make invisible
physics.addBody( middleBottom , "static", borderBodyElement )
middleBottom.onCollision = onLocalCollision2
middleBottom.myName="trave"

sceneGroup:insert(middleBottom)

borderLeft = display.newRect( 0, 0, 20 , _H*2 )
borderLeft:setFillColor("black" )    -- make invisible
physics.addBody( borderLeft, "static", borderBodyElement )
 borderLeft.onCollision = onLocalCollision2
 borderLeft.myName="border"

sceneGroup:insert(borderLeft)


 borderRight = display.newRect( _W , 20, 20, _H*2 )
borderRight:setFillColor("black")   -- make invisible
physics.addBody( borderRight, "static", borderBodyElement )
borderRight.onCollision = onLocalCollision2
borderRight.myName="border"

sceneGroup:insert(borderRight)


 borderTop1 = display.newRect( 0, 0, _W*2 , 20 )
borderTop1:setFillColor( "black")    -- make invisible
physics.addBody( borderTop1, "static", borderBodyElement )
borderTop1.onCollision = onLocalCollision2
borderTop1.myName="border" 


sceneGroup:insert(borderTop1)
    

   texTime=display.newText( "0", centerX, centerY-40 , native.systemFontBold, 50 )
   texTime:setFillColor( 0, 0, 0 )

   sceneGroup:insert(texTime)

filterEn = { groupIndex = -2 }
player = display.newCircle( 50 , 520 , 25 )
physics.addBody( player , "dinamic" , { density = 0 , friction = 0, bounce = 0 , radius = 25 , filter = filterEn })
player.hp = 5

player.myName="player"
player.alpha = 0.1

sceneGroup:insert(player)

playerHp = display.newText( "player hp:  ".. player.hp, display.contentCenterX - 50 , 40 , native.systemFontBold, 26 )

sceneGroup:insert(playerHp)

playerBar =  display.newRect( player.x , player.y-30,  50 , 10 )
playerBar:setFillColor( 000/255, 255/255, 0/255 )
playerBar.strokeWidth = 1
playerBar:setStrokeColor( 255, 255, 255, .5 )
damagePlayer = display.newRect( player.x , player.y-30 , 0 , 10 )
damagePlayer:setFillColor( 255/255, 0/255, 0/255 )

sceneGroup:insert(playerBar)
sceneGroup:insert(damagePlayer)

sprites = display.newSprite( sheet , sequencesPato )
sprites.isVisible=true
sprites.x=player.x
sprites.y=player.y
sprites:play()

 
sceneGroup:insert(sprites)



if( numFriends == 0 )then


end

if( numFriends == 1 )then


end

if ( numFriends == 2 )then

for i=1,2, 1 
  do
 fr = display.newCircle( math.random(  20 , _W/2 - 50 ), 520 , 25 )
    physics.addBody( fr , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
    fr.hp = life
    fr:setFillColor("black")
    fr.myName="friend"
    groupFriend:insert(fr)
  end

end




if( numEn == 1)then

  aux = 1 

for i=1,1, 1 
do  

    groupEn[i] = display.newCircle( math.random( _W/2+20 , _W/2 + 400 ), 520 , 25 )
  groupEn[i].id = aux
  groupEn[i].alpha = 0.1
  physics.addBody( groupEn[i] , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
  groupEn[i].hp = life
  groupEn[i]:setFillColor("black")
  groupEn[i].myName="enemy"
  aux = aux + 1
  sceneGroup:insert(groupEn[i])
 
 groupEn[i].timer = timers[i]


 lifeBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 ,  50 , 10)
groupEn[i].lifeBar = lifeBars[i]

--lifeBars[i] = display.newRect( en.x , en.y-30 ,  50 , 10)
lifeBars[i]:setFillColor( 000/255, 255/255, 0/255 )
lifeBars[i].strokeWidth = 1
lifeBars[i]:setStrokeColor( 255, 255, 255, .5 )
sceneGroup:insert(lifeBars[i])

--damageBars[i] = display.newRect( en.x , en.y-30 , 0 , 10 )
damageBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 , 0 , 10 )

damageBars[i]:setFillColor( 255/255, 0/255, 0/255 )
sceneGroup:insert(damageBars[i])
print(groupEn[i].id)
--en.dmg = damageBars[i]
groupEn[i].dmg = damageBars[i]

    spritesEn[i] = display.newSprite( sheet2 , sequencesPato )
    spritesEn[i].isVisible = true
    --spritesEn[i].x = en.x
    spritesEn[i].x= groupEn[i].x
    --spritesEn[i].y= en.y
    spritesEn[i].y= groupEn[i].y
    spritesEn[i]:play()
    groupEn[i].sprit = spritesEn[i]
    sceneGroup:insert(spritesEn[i])


end

  

end 




if( numEn == 2 )then

 aux = 1 

for i=1,2, 1 
do 
    
  groupEn[i] = display.newCircle( math.random( _W/2+20 , _W/2 + 400 ), 520 , 25 )
  groupEn[i].id = aux
  groupEn[i].alpha = 0.1
  physics.addBody( groupEn[i] , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
  groupEn[i].hp = life
  groupEn[i]:setFillColor("black")
  groupEn[i].myName="enemy"
  aux = aux + 1
  sceneGroup:insert(groupEn[i])
 
 groupEn[i].timer = timers[i]
print(groupEn[i].id)

 lifeBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 ,  50 , 10)
groupEn[i].lifeBar = lifeBars[i]

--lifeBars[i] = display.newRect( en.x , en.y-30 ,  50 , 10)
lifeBars[i]:setFillColor( 000/255, 255/255, 0/255 )
lifeBars[i].strokeWidth = 1
lifeBars[i]:setStrokeColor( 255, 255, 255, .5 )
sceneGroup:insert(lifeBars[i])

--damageBars[i] = display.newRect( en.x , en.y-30 , 0 , 10 )
damageBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 , 0 , 10 )

damageBars[i]:setFillColor( 255/255, 0/255, 0/255 )
sceneGroup:insert(damageBars[i])

--en.dmg = damageBars[i]
groupEn[i].dmg = damageBars[i]

    spritesEn[i] = display.newSprite( sheet2 , sequencesPato )
    spritesEn[i].isVisible = true
    --spritesEn[i].x = en.x
    spritesEn[i].x= groupEn[i].x
    --spritesEn[i].y= en.y
    spritesEn[i].y= groupEn[i].y
    spritesEn[i]:play()
    groupEn[i].sprit = spritesEn[i]
    sceneGroup:insert(spritesEn[i])
    

end

 

end


if( numEn == 3 )then

aux = 1

for i=1,3, 1 
do 
    
   
groupEn[i] = display.newCircle( math.random( _W/2+20 , _W/2 + 400 ), 520 , 25 )
  groupEn[i].id = aux
  groupEn[i].alpha = 0.1
  physics.addBody( groupEn[i] , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
  groupEn[i].hp = life
  groupEn[i]:setFillColor("black")
  groupEn[i].myName="enemy"
  aux = aux + 1
  sceneGroup:insert(groupEn[i])
 print(groupEn[i].id)
 groupEn[i].timer = timers[i]


 lifeBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 ,  50 , 10)
groupEn[i].lifeBar = lifeBars[i]

--lifeBars[i] = display.newRect( en.x , en.y-30 ,  50 , 10)
lifeBars[i]:setFillColor( 000/255, 255/255, 0/255 )
lifeBars[i].strokeWidth = 1
lifeBars[i]:setStrokeColor( 255, 255, 255, .5 )
sceneGroup:insert(lifeBars[i])

--damageBars[i] = display.newRect( en.x , en.y-30 , 0 , 10 )
damageBars[i] = display.newRect( groupEn[i].x , groupEn[i].y-30 , 0 , 10 )

damageBars[i]:setFillColor( 255/255, 0/255, 0/255 )
sceneGroup:insert(damageBars[i])

--en.dmg = damageBars[i]
groupEn[i].dmg = damageBars[i]

    spritesEn[i] = display.newSprite( sheet2 , sequencesPato )
    spritesEn[i].isVisible = true
    --spritesEn[i].x = en.x
    spritesEn[i].x= groupEn[i].x
    --spritesEn[i].y= en.y
    spritesEn[i].y= groupEn[i].y
    spritesEn[i]:play()
    groupEn[i].sprit = spritesEn[i]
    sceneGroup:insert(spritesEn[i])

end

  

end



    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        timerT = timer.performWithDelay( 700 , time , -1 )

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


