# Description:
#
# Dependencies:
#   "githubot": "0.4.x"
#
# Configuration:
#   HUBOT_GITHUB_REPO
#   HUBOT_GITHUB_LINE_LINK_IGNORE_USERS
#
# Commands:
#  "filepath" lines # to # - show a url highlighting the desired lines, filepath is case sensitive
#
# Author:
#   hashashin

module.exports = (robot) ->
  github = require("githubot")(robot)

  githubIgnoreUsers = process.env.HUBOT_GITHUB_LINE_LINK_IGNORE_USERS
  if githubIgnoreUsers == undefined
    githubIgnoreUsers = "github|hubot"

  robot.respond /(.*) lines (\d+) to (\d+)/i, (msg) ->
    return if msg.message.user.name.match(new RegExp(githubIgnoreUsers, "gi"))
    
    line1 = msg.match[2]
    line2 = msg.match[3]
    file = msg.match[1]
    url = "https://www.github.com"    
    bot_github_repo = github.qualified_repo process.env.HUBOT_GITHUB_REPO
    msg.send "#{url}/#{bot_github_repo}/blob/master/#{file}##{line1}-#{line2}"
