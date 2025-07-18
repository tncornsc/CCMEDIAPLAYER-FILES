write("enter song name")
local name = read()
local github = "https://raw.githubusercontent.com/tncornsx/CCMEDIAPLAYER-FILES/refs/head/main/files/"
local url = github .. name
local save = "/computer/music/" .. name .. ".dfpwm"
shell.run("wget", url, save)
 
