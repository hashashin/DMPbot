# Description:
#   An HTTP Listener for notifications on github pushes
#
# Dependencies:
#   "url": ""
#   "querystring": ""
#   "gitio2": "2.0.0"
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
gitio = require('gitio2')

module.exports = (robot) ->

  robot.router.post "/hubot/gh-commits", (req, res) ->
    query = querystring.parse(url.parse(req.url).query)

    res.send 200
    res.end ""

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
            gitio commit.url, (err, data) ->
              robot.send user, "  * #{commit.author.name}: #{commit.message} #{if err then commit.url else data}"
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
