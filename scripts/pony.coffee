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
  "Going for a ride: https://www.youtube.com/watch?v=JSUBuVdkskA",
  "Cupcakes (NSFW?): https://www.youtube.com/watch?v=43AuJjuxqAw",
  "Smile (NSFW?): https://www.youtube.com/watch?v=PqVVtaWd8Pw",
  "Rainbow factory: https://www.youtube.com/watch?v=4PjIhs72l0A",
  "It'll be ok: https://www.youtube.com/watch?v=z88WWrnROEs",
  #==Music==#
  "Celestia being deep: https://www.youtube.com/watch?v=dmVWvOC_2HU",
  "Luna's banishment: https://www.youtube.com/watch?v=9RAQsdTQIcs",
  "20% cooler: https://www.youtube.com/watch?v=u6xRSafBV8o",
  "Discord: https://www.youtube.com/watch?v=jDMGv3hNMes",
  "Find a pet: https://www.youtube.com/watch?v=SZ-oY158b_0",
  "Anything you can do I can do better: https://www.youtube.com/watch?v=Qp2dCIxaPHg",
  "Avast: https://www.youtube.com/watch?v=QKeMCXKSk5c",
  "Five nights at freddy's: https://www.youtube.com/watch?v=BKpN3OxVmwY",
  "A little travelling music: https://www.youtube.com/watch?v=Zo0cEzwlmq4",
  "Blob symphony: https://www.youtube.com/watch?v=hVvnuEVxvwQ",
  #==Nearly music==#
  "Can you go and use the elements?: https://www.youtube.com/watch?v=uyFs8lGq588",
  "Luna's let it go: https://www.youtube.com/watch?v=TZCvcJA_VkU",
  "Sinking ships: https://www.youtube.com/watch?v=OBgKP5erzWQ",
  "Pony waifu: https://www.youtube.com/watch?v=4mBa0civN5Y",
  "Luna's whine: https://www.youtube.com/watch?v=M8MzjICSqTU",
  #==Random==#
  "The matrix: https://www.youtube.com/watch?v=CtXZzncSA30",
  "Yugioh: https://www.youtube.com/watch?v=bRbVsUTud-0",
  "Lord of the rings: https://www.youtube.com/watch?v=y4hD31VTdsw",
  "Don't watch MLP: https://www.youtube.com/watch?v=RB2TwFjvxeM",
  "Break these cuffs: https://www.youtube.com/watch?v=0RtPuuOFdjo",
  "Banana song: https://www.youtube.com/watch?v=nBINO0i5td0",
  "Hypnocelestia: https://www.youtube.com/watch?v=IKUrwKJ_cis",
  "When I'm princess: https://www.youtube.com/watch?v=uzWmTyW30IM",
  "When I'm on the moon: https://www.youtube.com/watch?v=12460rr3sxk",
  "Portal 2: https://www.youtube.com/watch?v=L0cY2NWlddU",
  "PKMN Snap: https://www.youtube.com/watch?v=9WYZVmdw9gw",
  "General work day: https://www.youtube.com/watch?v=h0l28Qmj9MY",
  "Twilights the unicorn: https://www.youtube.com/watch?v=HBZPPsX6CHI",
  "Friendship is magic bitch: https://www.youtube.com/watch?v=k4f9m4OYkCY",
  "Epic pie time: https://www.youtube.com/watch?v=bQ0JahhFkts",
  "Bittersweet: https://www.youtube.com/watch?v=UMcA6NvJXmk",
  "Cartoon horse program: https://www.youtube.com/watch?v=V0f2TDqUp1U",
  "ALL HAIL THE CREATORS (Issue #252): https://www.youtube.com/v/ZbjA6pZqQXI&start=76&end=107&autoplay=1",
  "How twilight got her wings: https://www.youtube.com/watch?v=1K7twhkCANA",
  "The Sims (Doctor/Derpy): https://www.youtube.com/watch?v=EZG1K1-2omo",
  "The Sims (Octavia/Vinyl): https://www.youtube.com/watch?v=swnJM5J3Uts",
  "The Sims (Lyra/Bon bon): https://www.youtube.com/watch?v=Ium4BrJ0Emc",
  #==The reason why I watch the show==#
  #Damn luna, Kept me watching until S02E04, by which point it was far too late...
  "Nightmare night: https://www.youtube.com/watch?v=MRhRaWNaSPM",
  "Children of the night: https://www.youtube.com/watch?v=jW5n3k2VgZE"
]

module.exports = (robot) ->

  regex = /pony|MLP/i

  robot.hear regex, (msg) ->
    msg.send msg.random ponies
