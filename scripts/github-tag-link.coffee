# Description:
#
# Dependencies:
#   "githubot": "0.4.x"
#
# Configuration:
#   HUBOT_GITHUB_REPO
#   HUBOT_GITHUB_TAG_LINK_IGNORE_USERS
#
# Commands:
#  tag vX.X.X.X
#
# Author:
#   hashashin

module.exports = (robot) ->
  github = require("githubot")(robot)

  githubIgnoreUsers = process.env.HUBOT_GITHUB_LINE_TAG_IGNORE_USERS
  if githubIgnoreUsers == undefined
    githubIgnoreUsers = "github|hubot"

  robot.hear /tag v(.*)/, (msg) ->
    return if msg.message.user.name.match(new RegExp(githubIgnoreUsers, "gi"))
    
    tag = msg.match[1]
    url = "https://www.github.com"    
    bot_github_repo = github.qualified_repo process.env.HUBOT_GITHUB_REPO
    msg.send "#{url}/#{bot_github_repo}/releases/v#{tag}"
