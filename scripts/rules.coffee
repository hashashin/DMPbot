# Description:
#   Make sure that hubot knows the rules.
#
# Commands:
#   hubot the rules - Make sure hubot still knows the rules.
#
# Notes:
#   DON'T DELETE THIS SCRIPT! ALL ROBAWTS MUST KNOW THE RULES

rules = [
  "1. A robot may not injure a kerbal being or, through inaction, allow a kerbal being to come to harm.",
  "2. A robot must obey any orders given to it by kerbal beings, except where such orders would conflict with the First Law.",
  "3. A robot must protect its own existence as long as such protection does not conflict with the First or Second Law."
  ]

otherRules = [
  "A plugin developer may not injure Squad or, through inaction, allow Squad to come to harm.",
  "A plugin developer must obey any orders given to it by Squad, except where such orders would conflict with the First Law.",
  "A plugin developer must protect its own existence as long as such protection does not conflict with the First or Second Law."
  ]

module.exports = (robot) ->
  robot.respond /(what are )?the (three |3 )?(rules|laws)/i, (msg) ->
    text = msg.message.text
    if text.match(/squad/i) or text.match(/dev/i)
      msg.send otherRules.join('\n')
    else
      msg.send rules.join('\n')

