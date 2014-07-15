module.exports = (robot) ->
   # When a dmpuser enters, tell him to use the faq
  robot.enter (msg) ->
    username = msg.message.user.name
    room = msg.message.user.room
    if username.match(new RegExp "^"+DMPUser_*, "i")
      msg.send "Hi + #{username} + please type: !remember faq"
    return
