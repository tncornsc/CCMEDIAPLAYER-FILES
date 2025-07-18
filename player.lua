--player.lua
local audio = require("audio")
 
local function getBaseName(path)
    return path:match("([^/\\]+%.dfpwm$")
end
 
local function getSongsInFolder(folder)
    local files = fs.list(folder)
    local songs = {}
    for _, file in ipairs(files) do
        if file:match("%.dfpwm$") then
            table.insert(songs, fs.combine(folder, file))
        end
    end
    return songs
end
 
local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end
 
local folder = "computer/music/"
local songs = getSongsInFolder(folder)
if #songs == 0 then
    print("no songs")
    return
end
 
while true do
    shuffle(songs)
    for _, song in ipairs(songs) do
    local name = getBaseName(song)
    term.clear()
    term.setCursorPos(1, 1)
    print("Now playing: " .. (name or "???"))
    audio.play(song, 1.0)
    end
end
