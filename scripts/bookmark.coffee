# Description:
#   Manage your links and bookmarks. Links get stored in the robot brain while
#   bookmarks get stored at delicious.com. Also keeps a history of all URLs in
#   the "urls" section of the robot brain. 
#
# Dependencies:
#   "xml2js": "0.1.14"
#
# Configuration:
#   DELICIOUS_USER
#   DELICIOUS_PASSWORD
#
# Commands:
#   hubot bookmark <url> as <description> - add a url to your delicious feed
#   hubot link <url> as <description> - add a url to the robot brain
#   hubot link me for <description> - find a link by description
#   hubot list bookmarks - get a list of the 15 most recent bookmarks
#   hubot list links - List all of the links that are being tracked
#   hubot feed me - get the URL to subscribe to your bookmark rss
#
# Author
#   mm53bar

module.exports = (robot) ->
  robot.respond /delete links/i, (msg) ->
    delete robot.brain.data.urls
    delete robot.brain.data.links
    msg.reply "Done"
