# Description:
#   An HTTP Listener that notifies about new Github issues
#
# Dependencies:
#   "url": ""
#   "querystring": ""
#
# Configuration:
#   You will have to do the following:
#   1. Get an API token: curl -u 'username' -d '{"scopes":["repo"],"note":"Hooks management"}' \
#                         https://api.github.com/authorizations
#   2. Add <HUBOT_URL>:<PORT>/hubot/gh-issues?room=<room>[&type=<type>] url hook via API:
#      curl -H "Authorization: token <your api token>" \
#      -d '{"name":"web","active":true,"events":["issues"],"config":{"url":"<this script url>","content_type":"json"}}' \
#      https://api.github.com/repos/<your user>/<your repo>/hooks
#
# Commands:
#   None
#
# URLS:
#   POST /hubot/gh-issues?room=<room>[&type=<type]
#
# Authors:
#   hashashin

url = require('url')
querystring = require('querystring')

module.exports = (robot) ->

  robot.router.post "/hubot/gh-issues", (req, res) ->
    query = querystring.parse(url.parse(req.url).query)

    res.end

    user = {}
    user.room = query.room if query.room
    user.type = query.type if query.type

    try
      announceIssues req.body, (what) ->
        robot.send user, what
    catch error
      console.log "github issue notifier error: #{error}. Request: #{req.body}"


announceIssues = (data, cb) ->
  if data.action == 'opened'
    cb "New issue ##{data.issue.number} \"#{data.issue.title}\" by #{data.issue.user.login}: #{data.issue.html_url}"
  else if data.action == 'closed'
    cb "Issue ##{data.issue.number} \"#{data.issue.title}\" by #{data.issue.user.login} closed by #{data.sender.login}"
  else if data.action == 'reopened'
    cb "Issue ##{data.issue.number} \"#{data.issue.title}\" by #{data.issue.user.login} reopened by #{data.sender.login}"
