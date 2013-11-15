# Description:
#   Show some help to git noobies
#
# Dependencies:
#   jsdom
#   jquery
#
# Configuration:
#   None
#
# Commands:
# hubot git help <topic>
#
# Author:
#   vquaiato, Jens Jahnke

jsdom = require("jsdom").jsdom

module.exports = (robot) ->
  robot.respond /git help (.+)$/i, (msg) ->
    replyto = msg.message.user.name
    topic = msg.match[1].toLowerCase()

    url = 'http://git-scm.com/docs/git-' + topic
    msg.http(url).get() (err, res, body) ->
      window = (jsdom body, null,
        features:
          FetchExternalResources: false
          ProcessExternalResources: false
          MutationEvents: false
          QuerySelector: false
      ).createWindow()

      $ = require("jquery").create(window)
      name = $.trim $('#header .sectionbody .paragraph').text()
      desc = $.trim $('#_synopsis + .sectionbody').text()

      if name and desc
        robot.send({user: {name: replyto}}, name)
        robot.send({user: {name: replyto}}, desc)
        robot.send({user: {name: replyto}}, "See #{url} for details.")
      else
        robot.send({user: {name: replyto}}, "No git help page found for #{topic}.")
