# Description:
#   An HTTP Listener for notifications on github pushes
#
# Dependencies:
#   "url": ""
#   "querystring": ""
#
# Configuration:
#   Just put this url <HUBOT_URL>:<PORT>/hubot/gh-commits?room=<room> into you'r github hooks
#
# Commands:
#   None
#
# URLS:
#   POST /hubot/gh-commits?room=<room>[&type=<type]
#
# Authors:
#   nesQuick

url = require('url')
querystring = require('querystring')

module.exports = (robot) ->

  robot.router.post "/hubot/gh-commits", (req, res) ->
    query = querystring.parse(url.parse(req.url).query)

    res.end

    user = {}
    user.room = query.room if query.room
    user.type = query.type if query.type

    try
      payload = JSON.parse req.body.payload
      branch = payload.ref.replace(/refs\/heads\/?/, '')

      if payload.commits.length > 0
        robot.send user, "Got #{payload.commits.length} new #{pluralize('commit', payload.commits.length)}" + 
        " to #{payload.repository.name} on branch #{branch}"
        for commit in payload.commits
          do (commit) ->
            robot.send user, "  * #{commit.author.name}: #{commit.message} -- #{commit.url}"
      else
        if payload.created
          bmaster = payload.base_ref.replace(/refs\/heads\/?/, '')
          robot.send user, "#{payload.pusher.name} created: branch #{branch} from #{bmaster}"
        if payload.deleted
          robot.send user, "#{payload.pusher.name} deleted: branch #{branch}"

    catch error
      console.log "github-commits error: #{error}. Payload: #{req.body.payload}"

# not too smart, but it does what we need
pluralize = (word, num) ->
  word + (if num > 1 then 's' else '')
