# Class: copperegg::params
#
# Copyright 2012, CopperEgg
#
#  revealCloudAPIKey
#   Your User API Key.  Can be found in the CopperEgg UI :
#   Click on the Settings Tab => Click on Personal Settings => bottom panel
#     REQUIRED.  Revealcloud will not work without this attribute.
#
#  revealCloudServiceName
#   REQUIRED. MUST be set to 'revealcloud'.
#
#  revealCloudTags
#   Comma separated list of tags to apply.  Useful for grouping systems.
#   Any nonexistant tags specified here will be created.
#     Note: Tags may not have spaces. A space between two words will cause
#     the words to be treated as two separate tags.
#     Note: Any tags already applied to a server being monitored will remain.
#     Setting tags here will only add tags.
#   Example: $revealCloudTags = 'AppTier, DbTier'
#     Optional.  This field may be left blank.
#
#  revealCloudLabel
#   Label to apply to this system.  Only one may be specified.
#     WARNING: labels are used in place of hostname in the Dashboard
#     and Alerts. Use only if this recipe is deployed to a single server,
#     or you desire multiple servers to have the same label.
#     If this is not your desire, you may want to use a tag instead.
#     Note: Do not include spaces in your label.
#     Note: Leaving blank will not remove a label that is already set on a
#     monitored system.
#   Example: $revealCloudLabel = 'AppServer24-Tier1'
#     Optional.  This field may be left blank.
#
#  revealCloudProxy
#   Proxy to use to connect to revealcloud api from monitored server.
#   Most users should leave this blank unless they know they need it.
#     Optional.  This field may be left blank.
#     Example: $revealCloudProxy = 'myproxy.mycorp.com:8080'
#
#  revealCloudOomProtect
#   Flag for determining if the Linux Out Of Memory manager (OOM) should be
#   allowed
#   to kill the RevealCloud process.  Can be overridden at the node level.
#   true  => OOM protection Enabled; can NOT be killed by OOM.
#   Agent will be started with -O.
#     false => OOM protection disabled; CAN be killed by oom. Default.
#     Recommended.
#
#  revealCloudUUID
#   A string to use for the UUID of an individual instance.
#   Used for overriding the default UUID.
#   WARNING: This field is included to cover rare use cases. If used, you must
#   apply a different, unique UUID to every monitored server.
#   Optional. If left blank, the default UUID will be used.  Recommended.
#
class copperegg::params {
  $revealCloudAPIKey      = ''
  $revealCloudServiceName = 'revealcloud'
  $revealCloudTags        = "${hostname},${cluster},${role}"
  $revealCloudLabel       = ''
  $revealCloudProxy       = ''
  $revealCloudOomProtect  = "false"
  $revealCloudUUID        = ''
}
