rednet.open("left")
while true do
  local sender, message, protocol, = rednet.receive()
  if message == "butler show" then
    shell.run("butler show")
  elseif message == "butler hide" then
    shell.run("butler hide")
  end
end