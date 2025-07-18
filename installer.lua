local github = "https://raw.githubusercontent.com/tncornsc/CCMEDIAPLAYER-FILES/refs/heads/main"
shell.run("cd ../")
shell.run("mkdir /computer/")
shell.run("cd /computer/")
shell.run("mkdir /computer/music/")
shell.run("wget", github .. "/audio.lua", "/computer/audio.lua")
shell.run("wget", github .. "/player.lua", "/computer/player.lua")
shell.run("wget", github .. "/musicdownloader.lua", "/computer/downloader.lua")
