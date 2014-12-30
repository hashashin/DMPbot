# Description:
#   When a dmpuser enters the channel, tell him to use the faq
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   hashashin

module.exports = (robot) ->
  robot.enter (msg) ->
    username = msg.message.user.name
    room = msg.message.user.room
    if username.match(new RegExp "*_Kerman", "i")
      msg.send "Hi #{username}, please type: '!faq', without quotes, to see if I can help you. Useful readings: http://git.io/FxmJrg and http://git.io/h3huWw"
    return
