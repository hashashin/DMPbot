# Description:
#   FAQ script for DMP plugin.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot faq - returns faq keyphrases.
#
# Author:
#   JoshBlake (faq text)
#   hashashin (script)

faqindex = "Current FAQ keyphrases: !can't see friends, !changelog, !firewall, !http status port, !in atmosphere spawning, !mods, !port forwarding, !portforward2, !safety bubble, !science, !server ports, !spectating, !warpmodes"
cantseefriends = "Some reasons you can't see your friends in DMP (brackets are faq keyphrases): one of you is in a <!safety bubble>, they aren't connected to the server, they can't connect because of <!port forwarding> or <!firewall>, <!in atmosphere spawning> not done yet."
changelog = "To see the changes in develop, check the github master branch commit messages: https://github.com/godarklight/DarkMultiPlayer/commits/master"
firewall = "Once you set up port forwarding on your router, you also need to configure your computer's firewall to allow connections for a port. This will vary by operating system and if you have third-party firewalls installed. Google for your specific setup, such as 'windows 8 firewall open port' or 'zonealarm firewall open port'."
httpstatusport = "The http status port is configured in DMPServerSettings.txt as httpport. It returns data about server status and is disabled by default (set to 0) in latest dev builds. If you are running a private server, you can leave it disabled. If you want to list your server on the public server list, you can enable it by setting it to 8081 or another port, then port forwarding that port."
atmospawn = "Normally KSP will delete ships that enter the atmosphere unpiloted. DMP tries to prevent that so you can see other players flying in the atmosphere. It is a work in progress, though, and the latest dev builds work better than the latest release."
portfoward = "If you are behind a router, you have a private IP address like 192.168.1.x. Your router (probably) has a public IP address and hides your computers for security reasons. Your computer can start connections to the internet, but the internet cannot start a connection to you, unless you forward a port on your router. Type !portforward2, for more details."
portfoward2 = "Normally when the router receives a connection from the internet for port 6702 (DMPServer) it will ignore it. This is what keeps your private computers safe from common internet attacks. If you set up port forwarding, that tells the router 'when you receive a connection for port 6702, forward it to 192.168.1.x'  which would be your private computer running DMPServer. See http://portforward.com and http://canyouseeme.org."
safetybubble = "The safety bubble is a 100m area around the launch pad and runway spawn point where other players cannot see your ship. The safety bubble is necessary right now to prevent explosions and other bad things from happening when multiple players launch or leave behind debris. It cannot be disabled. Simply leave the 100m safety bubble so other people can see you."
science = "On career mode servers science is saved per user. Shared science among users is not implemented yet. The release servers may or may not have some science saving bugs that are fixed in the latest dev version."
serverports = "DMPServer.exe uses port 6702 by default for game communication and an optional http port for public server status. To set up a server that other people can see, you need to make sure the public internet can connect to your computer. For a home computer, this involves configuring your PC firewall and also setting up port forwarding on your router. See also: !port forwarding, !http status port, !firewall."
spectating = "You can spectate other players by switching to the same ship as them using map view or the tracking station. When you spectate, you can see what their ship is doing but cannot control it. If they leave the vessel, you will get control."
warpmodes = "Please read https://github.com/godarklight/DarkMultiPlayer#warpmode"
mods = "DMPServer uses DMPModControl.txt to control mods and parts allowed to sync to the server. A DMPModControl.txt file can be generated from your KSP install by opening the client options window and hitting 'Generate DMPModControl.txt'. Blacklist is less restrictive and is recommended for private servers."
logfile = "The ksp log file is located in the 32bits version in 'KSP/KSP_DATA/output_log.txt' and in the 64bits version in 'KSP/KSP_x64_DATA/output_log.txt'. You can upload that file to pastebin.com or similar."

module.exports = (robot) ->
  robot.respond /faq/i, (msg) ->
    msg.send faqindex
  robot.respond /can't see friends/i, (msg) ->
    msg.send cantseefriends
  robot.respond /changelog/i, (msg) ->
    msg.send changelog
  robot.respond /firewall/i, (msg) ->
    msg.send firewall
  robot.respond /http status port/i, (msg) ->
    msg.send httpstatusport
  robot.respond /in atmosphere spawning/i, (msg) ->
    msg.send atmospawn
  robot.respond /port forwarding/i, (msg) ->
    msg.send portfoward
  robot.respond /portforward2/i, (msg) ->
    msg.send portfoward2
  robot.respond /safety bubble/i, (msg) ->
    msg.send safetybubble
  robot.respond /science/i, (msg) ->
    msg.send science
  robot.respond /server ports/i, (msg) ->
    msg.send serverports
  robot.respond /spectating/i, (msg) ->
    msg.send spectating
  robot.respond /warpmodes/i, (msg) ->
    msg.send warpmodes
  robot.respond /mods/i, (msg) ->
    msg.send mods
  robot.respond /logfile/i, (msg) ->
    msg.send logfile
