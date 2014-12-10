# Description:
#   Seppuku behead
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   none
#
# Author:
#   hashashin

module.exports = (robot) ->
  robot.hear /Commited seppuku\b/i, (msg) ->
    msg.send " I'm going to cut your head off, my friend, but I only have a bushido fork..."
