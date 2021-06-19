print("Starting")
rednet.open("back")
while true do
  local event, character = os.pullEvent("char")
  if character == "1" then
    rednet.broadcast("butler place")
  elseif character == "2" then
    rednet.broadcast("butler show")
  elseif character == "3" then
    rednet.broadcast("butler hide")
  elseif character == "9" then
    rednet.broadcast("updateButler")
  elseif character == "0" then
    break
  end
end