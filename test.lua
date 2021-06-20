while true do
  local event, senderID, message = os.pullEvent("rednet_message")
  print(message)
end