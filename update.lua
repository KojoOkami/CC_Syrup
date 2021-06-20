shell.run("pastebin get 4nRg9CHU json")
os.loadAPI("json")
local tArgs, gBranch = {...}, "alpha"
 
local fileList = {dirs={},files={}}
local x , y = term.getSize()
local websocket = nil 

-- Connect to Proxy
function connect()
    local connectionURL = "ws://nekomataAlpha.loca.lt"
    local ws, err = http.websocket(connectionURL)
    if not ws then
        return
    else
        print("Connected")
        websocket = ws
    end
end

-- Set File
function setFile( name, content )
    print("Downloading File: "..name)
    local file = fs.open(name,"w")
    file.write(content)
    file.close()
end

-- Send File
function sendFile( name, content, to )
    print("Sending File: "..name)
    local data = {
        id = "alpha",
        to = "epsilon",
        request = "update",
        data = {
            name = name,
            content = content
        }
    }
    rednet.broadcast(textutils.serialize(data), "vampireIncProtocol")
end
 
-- Get Directory Contents
function getGithubContents(branch)
    websocket.send('{"id": "alpha", "to": "proxy", "request": "update", "data": "'..branch..'"}')
end
 
-- Main Function
function main()
    print("Connecting to Proxy...")
    connect()
    if websocket == nil then
        print("Failed")
        return
    end
    local data = {}
    local i = 1
    getGithubContents(tArgs[1])
    while true do
        local _, url, response, isBinary = os.pullEvent("websocket_message")
        response = json.decode(response)
        if response['id'] == 'proxy' and response['to'] == 'alpha' and response['request'] == 'update' then
            data[i] = {name = response['data']['name'], content = response['data']['content']}
        elseif response['id'] == 'proxy' and response['to'] == 'alpha' and response['request'] == 'close' then
            break
        end
        i = i + 1
    end
    print("Download completed ("..i.." files downloaded)")
    print("Updating files...")
    if tArgs[1] == "alpha" then
        shell.run("rm *")
    end 
    if tArgs[1] == "alpha" then
        for i,file in ipairs(data) do
            setFile(file['name'], file['content'])
        end
    else
        for i,file in ipairs(data) do
            sendFile(file['name'], file['content'], tArgs[1])
        end
    end
    print("Update completed")
    sleep(5)
    os.reboot()
end
 
if not http then
    print("You need to enable the HTTP API!")
    sleep(3)
    term.clear()
    term.setCursorPos(1,1)
else
    if tArgs[1] == nil then tArgs[1] = gBranch end
    main()
end