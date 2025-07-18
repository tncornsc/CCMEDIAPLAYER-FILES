-- audio.lua
local dfpwm = require("cc.audio.dfpwm")
 
local function play(path, volume)
    local speaker = peripheral.find("speaker")
    if not speaker then
        print("No speaker connected")
    end
    vol = volume or 1.0
    local file = fs.open(path, "rb")
    if not file then
         print("file not found")
    end
    local decoder = dfpwm.make_decoder()
    while true do
        local chunk = file.read(16 * 1024)
        if not chunk then break end
        local decoded = decoder(chunk)
        while not speaker.playAudio(decoded, volume) do
            os.pullEvent("speaker_audio_empty")
        end
    end
    file.close()
end
return {
    play = play
}
 
