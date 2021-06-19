args = {...}

local function show()

  if not turtle.select(2) then
    print("Cannot select 2")
  end

  turtle.digUp()
  turtle.placeUp()

  for i = 1,3,1 do
    turtle.forward()
    turtle.forward()
    turtle.digUp()
    turtle.placeUp()
  end

  for i = 1,6,1 do
    turtle.back()
  end
  
  turtle.select(3)
  turtle.transferTo(1)

end

local function hide()

  if not turtle.select(1) then
    print("Cannot select 1")
  end

  turtle.digUp()
  turtle.placeUp()

  for i = 1,3,1 do
    turtle.forward()
    turtle.forward()
    turtle.digUp()
    turtle.placeUp()
  end

  turtle.back()
  turtle.turnRight()

  for i = 1,7,1 do
    turtle.forward()
  end

  turtle.digUp()
  turtle.up()
  turtle.digUp()
  turtle.down()
  turtle.placeUp()

  turtle.forward()
  turtle.digUp()
  turtle.up()
  turtle.digUp()
  turtle.up()
  turtle.digUp()
  turtle.down()
  turtle.down()
  turtle.placeUp()

  turtle.forward()
  turtle.digUp()
  turtle.up()
  turtle.digUp()
  turtle.down()
  turtle.placeUp()

  turtle.select(6)
  turtle.transferTo(1)

  for i = 1,9,1 do
    turtle.back()
  end

  turtle.turnLeft()

  for i = 1,5,1 do
    turtle.back()
  end

end

local function place()

  for i = 1,5,1 do
    turtle.forward()
  end

  turtle.turnRight()

  for i = 1,7,1 do
    turtle.forward()
  end

  turtle.digUp()
  turtle.up()
  turtle.select(3)
  turtle.placeUp()
  turtle.down()
  turtle.select(1)
  turtle.placeUp()

  turtle.forward()
  turtle.digUp()
  turtle.up()
  turtle.up()
  turtle.select(4)
  turtle.placeUp()
  turtle.down()
  turtle.select(5)
  turtle.placeUp()
  turtle.down()
  turtle.select(1)
  turtle.placeUp()

  turtle.forward()
  turtle.digUp()
  turtle.up()
  turtle.select(3)
  turtle.placeUp()
  turtle.down()
  turtle.select(1)
  turtle.placeUp()

  turtle.select(3)
  turtle.transferTo(1)

  for i = 1,9,1 do
    turtle.back()
  end

  turtle.turnLeft()

  for i = 1,5,1 do
    turtle.back()
  end

end

if args[1] == "show" then
  show()
elseif args[1] == "hide" then
  hide()
elseif args[1] == "place" then
  place()
end