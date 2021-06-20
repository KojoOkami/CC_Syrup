shell.run('pastebin get 2GViymWd convertFunc')
os.loadAPI("convertFunc")

-- Proxy Connect (Archived)
local function connect()

  local connectionURL = "ws://nekomataAlpha.loca.lt"
  local ws, err = http.websocket(connectionURL)
  if not ws then
    return
  else
    print("Connected")
  end

  while true do
    while true do
      local _, url, response, isBinary = os.pullEvent("websocket_message")

      -- We need this if statement to check that we received the message from
      -- the correct websocket. After all, you can have many websockets connected to
      -- different URLs.
      if url == connectionURL then
        local msg = response
        if msg == nil then
            break
        end
        local obj = convert.decode(msg)
        if obj["func"] == "close" then
          ws.send("-- Closing")
          ws.close()
          return
        elseif obj["func"] == "refresh" then
          ws.send("-- Refresh")
        else
          print("Received")
          local func = loadstring(obj["func"])
          func()
        end
      end  
    end
  end
end