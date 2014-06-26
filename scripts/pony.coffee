# Description:
#   Pony Motivation
#
# Dependencies:
#   None
#
# Commands:
#   pony - Display a pony video
#
# Author:
#   godarklight

#For those that actually clicked on this script, this if my favourite fan episode
#Bittersweet - https://www.youtube.com/watch?v=UMcA6NvJXmk

#My favourite actual episode would be S02E04 because Luna.

ponies = [
  #==Slighty disturbing music==#
  #Were going for a ride
  "https://www.youtube.com/watch?v=JSUBuVdkskA",
  #Cupcakes HD
  "https://www.youtube.com/watch?v=43AuJjuxqAw",
  #Smile HD
  "https://www.youtube.com/watch?v=PqVVtaWd8Pw",
  #Rainbow Factory
  "https://www.youtube.com/watch?v=4PjIhs72l0A",
  #==Music==#
  #Princess celestia being deep
  "https://www.youtube.com/watch?v=dmVWvOC_2HU",
  #Ken ashcorp - 20% cooler
  "https://www.youtube.com/watch?v=u6xRSafBV8o",
  #Super ponybeat - Discord
  "https://www.youtube.com/watch?v=jDMGv3hNMes",
  #Super ponybeat - Find a pet
  "https://www.youtube.com/watch?v=SZ-oY158b_0",
  #==Nearly music==#
  #Can you go and use the elements?
  "https://www.youtube.com/watch?v=uyFs8lGq588",
  #Sinking ships
  "https://www.youtube.com/watch?v=OBgKP5erzWQ",
  #Tubby Wubby Pony Waifu
  "https://www.youtube.com/watch?v=4mBa0civN5Y",
  #Princess luna's whine
  "https://www.youtube.com/watch?v=M8MzjICSqTU",
  #==Random==#
  #The Matrix Re-enacted by Ponies
  "https://www.youtube.com/watch?v=CtXZzncSA30",
  #Yugioh Re-enacted by Ponies
  "https://www.youtube.com/watch?v=bRbVsUTud-0",
  #Don't Watch a Cartoon Called My Little Pony
  "https://www.youtube.com/watch?v=RB2TwFjvxeM",
  #Discord can break these cuffs
  "https://www.youtube.com/watch?v=0RtPuuOFdjo",
  #Princess celesita's banana song
  "https://www.youtube.com/watch?v=nBINO0i5td0",
  #==The reason why I watch the show==#
  #Damn luna, Kept me watching until S02E04, by which point it was far too late...
  #Nightmare Night [SFM]
  "https://www.youtube.com/watch?v=MRhRaWNaSPM",
  #Children of the night
  "https://www.youtube.com/watch?v=jW5n3k2VgZE"
]

module.exports = (robot) ->

  regex = /pony|MLP/i

  robot.hear regex, (msg) ->
    msg.send msg.random ponies
