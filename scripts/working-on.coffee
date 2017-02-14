# Description:
#   Tell Hubot what you're working on so he can give out status updates when asked
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot i am working on <anything> - Set what you're working on
#   hubot what is everyone working on? - Find out what everyone is working on
#   hubot forget my work - Delete your current working on data.
#
# Author:
#   beezee

module.exports = (robot) ->
  admin = process.env.HUBOT_AUTH_ADMIN
  robot.respond /what is @?([\w .\-]+) working on(\?)?$/i, (msg) ->
    replyto = msg.message.user.name
    name = msg.match[1].trim()

    if name is "you"
      msg.send "I dunno, robot things I guess."
    else if name.toLowerCase() is robot.name.toLowerCase()
      msg.send "World domination!"
    else if name.match(/(everybody|everyone)/i)
      messageText = ''
      users = robot.brain.users()
      for k, u of users
        if u.workingon
          messageText += "#{u.name} is working on #{u.workingon}\n"
        else
          messageText += ""
      if messageText.trim() is "" then messageText = "Nobody told me a thing."
      robot.send({user: {name: replyto}}, messageText)
    else
      users = robot.brain.usersForFuzzyName(name)
      if users.length is 1
        user = users[0]
        user.workingon = user.workingon or [ ]
        if user.workingon.length > 0
          msg.send "#{name} is working on #{user.workingon}."
        else
          msg.send "#{name} is slacking off."
      else if users.length > 1
        msg.send getAmbiguousUserText users
      else
        msg.send "#{name}? Who's that?"

  robot.respond /(i\'m|i am|im) working on (.*)/i, (msg) ->
    name = msg.message.user.name
    user = robot.brain.userForName name

    if typeof user is 'object'
      user.workingon = msg.match[2]
      robot.send({user: {name: name}},"Okay #{user.name}, got it. Remember to make me forget the work when you finish it! Use: /msg DMPbot forget my work")
    else if typeof user.length > 1
      msg.send "I found #{user.length} people named #{name}"
    else
      msg.send "I have never met #{name}"

  robot.respond /forget (my|@?([\w .\-]+)) work/i, (msg) ->
    name = msg.match[1].trim()
    if name is "my" or name.match(msg.message.user.reply_to)
      try
        user = robot.brain.userForName msg.message.user.reply_to
        delete robot.brain.data.users[user.id].workingon
        msg.send "Ok #{msg.message.user.reply_to}, work data deleted"
      catch error
        console.log "Hubot workingon:", error
        msg.send "Try again by query me please."
    else
      if msg.message.user.reply_to == admin
        user = robot.brain.userForName name
        try
          delete robot.brain.data.users[user.id].workingon
          msg.send "Ok master, deleted work data for #{name}"
        catch error
          console.log "Hubot workingon:", error
          msg.send "Try again by query me please."
      else
        msg.send "I'm sorry #{msg.message.user.name}, I'm afraid I can't do that."
