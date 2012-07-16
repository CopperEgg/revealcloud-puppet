# Class: copperegg::params
#
# This module manages the CopperEgg parameters
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class copperegg::params {
  $revealCloudAPIKey      = ''
  $revealCloudServiceName = 'revealcloud'
  $revealCloudTags        = "${hostname},${cluster},${role}"
  $revealCloudLabel       = ""
  $revealCloudProxy       = ""
  $revealCloudOomProtect  = "false"
  $revealCloudUseFQDN     = "false"
}
