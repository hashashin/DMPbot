# Description:
# Hubot enjoys delicious snacks
#
# Dependencies:
# None
#
# Configuration:
# None
#
# Commands:
# KMPbot tell me <what you want KMPbot to tell you>
#
# Author:
# KvickFlygarn


module.exports = (robot) ->
  robot.respond /tell me (.*)/i, (msg) ->
    replyto = msg.message.user.name
    
    msg = msg.match[1]
    
    robot.send({user: {name: replyto}}, msg)
    
