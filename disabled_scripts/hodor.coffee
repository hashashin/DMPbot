# Description:
#   Hodor!
#
# Dependencies:
#   cron
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   hashashin

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  new cronJob('00 59 * * * *', everyHour(robot), null, true)

everyHour = (robot) ->
  -> robot.messageRoom '#DMP', 'Hodor!'
