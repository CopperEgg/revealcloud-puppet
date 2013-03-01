# Class: copperegg::install
#
# Copyright 2012 CopperEgg
#
include copperegg::install
class copperegg::install() inherits copperegg {
  include copperegg

  include copperegg::params
  file { '/tmp/revealcloud' :
    ensure  => directory,
    mode    => "0755",
  }

  exec { 'Install RevealCloud Collector':
    unless  => "/usr/bin/test -f /usr/local/revealcloud/revealcloud",
    require     => File [ '/tmp/revealcloud' ],
    cwd         => "/tmp/revealcloud",
    environment => create_env_array( {"RC_UUID="        => $copperegg::uuid,
                                      "RC_TAG="         => $copperegg::tags,
                                      "RC_OOM_PROTECT=" => $copperegg::OOM_protect,
                                      "RC_LABEL="       =>  $copperegg::label,
                                      "RC_PROXY="       => $copperegg::proxy } ),
    command     => "/usr/bin/curl http://${copperegg::api_key}@api.copperegg.com/rc.sh | sh",
    creates     => "/usr/local/revealcloud/revealcloud",
  }
}
