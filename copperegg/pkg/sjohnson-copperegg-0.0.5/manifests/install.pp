# Class: copperegg::install
#
# Copyright 2012, CopperEgg
#
class copperegg::install() {
  include copperegg::params

  file { '/tmp/revealcloud' :
    ensure  => directory,
    mode    => "0755",
  }

  exec { 'Install RevealCloud Collector':
    unless      => "/usr/bin/test -f /usr/local/revealcloud/revealcloud",
    require     => File [ '/tmp/revealcloud' ],
    cwd         => "/tmp/revealcloud",
    environment => [
                  "RC_UUID=${copperegg::params::revealCloudUUID}",
                  "RC_TAG=${copperegg::params::revealCloudTags}",
                  "RC_OOM_PROTECT=${copperegg::params::revealCloudOomProtect}",
                  "RC_LABEL=${copperegg::params::revealCloudLabel}",
                  "RC_PROXY=${copperegg::params::revealCloudProxy}",
                   ],
    command     => "/usr/bin/curl -s http://${copperegg::params::revealCloudAPIKey}@api.copperegg.com/rc.sh | sh",
    creates     => "/usr/local/revealcloud/revealcloud",

  }
}
