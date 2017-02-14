# Description:
#   Send messages to users the next time they speak
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ambush <user name>: <message>
#
# Author:
#   jmoses

appendAmbush = (data, toUser, fromUser, message) ->
  data[toUser.name] or= []

  data[toUser.name].push [fromUser.name, message]

module.exports = (robot) ->
  robot.brain.on 'loaded', ->
    robot.brain.data.ambushes ||= {}

  robot.respond /ambush (.*?): (.*)/i, (msg) ->
    users = robot.brain.usersForFuzzyName(msg.match[1].trim())
    if users.length is 1
      user = users[0]
      appendAmbush(robot.brain.data.ambushes, user, msg.message.user, msg.match[2])
      msg.send "Ambush prepared"
    else if users.length > 1
      msg.send "Too many users like that"
    else
      msg.send "#{msg.match[1]}? Never heard of 'em"

  robot.hear /./i, (msg) ->
    replyto = msg.message.user.name
    return unless robot.brain.data.ambushes?
    if (ambushes = robot.brain.data.ambushes[msg.message.user.name])
      robot.send({user: {name: replyto}}, "Hey, " + msg.message.user.name + ", while you were out:")
      for ambush in ambushes
        robot.send({user: {name: replyto}}, ambush[0] + " said: " + ambush[1])
      robot.send({user: {name: replyto}}, "That's it. You were greatly missed.")
      delete robot.brain.data.ambushes[msg.message.user.name]
