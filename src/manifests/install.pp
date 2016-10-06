# Class: copperegg::install
#
# Copyright 2012 IDERA
#
class copperegg::install() inherits copperegg {

  include copperegg::params
  file { '/tmp/revealcloud' :
    ensure  => directory,
    mode    => "0755",
  }

  exec { 'Download Install Script':
    unless  => "/usr/bin/test -f /usr/local/revealcloud/revealcloud",
    require    => File [ '/tmp/revealcloud' ],
    cwd        => "/tmp/revealcloud",
    notify     => Exec ['Install RevealCloud Collector'],
    command    => "/usr/bin/curl http://${copperegg::api_key}@api.copperegg.com/rc.sh > /tmp/revealcloud/rc.sh",
    creates    => "/tmp/revealcloud/rc.sh",
  }

  exec { 'Install RevealCloud Collector':
    unless  => "/usr/bin/test -f /usr/local/revealcloud/revealcloud",
    refreshonly => true,
    require     => File [ '/tmp/revealcloud' ],
    cwd         => "/tmp/revealcloud",
    onlyif	=> '/bin/chmod 755 /tmp/revealcloud/rc.sh',
    environment => create_env_array( {"RC_UUID="        => $copperegg::uuid,
                                      "RC_TAG="         => $copperegg::tags,
                                      "RC_OOM_PROTECT=" => $copperegg::OOM_protect,
                                      "RC_LABEL="       => $copperegg::label,
                                      "RC_PROXY="       => $copperegg::proxy } ),
    command    => "/bin/sh /tmp/revealcloud/rc.sh",
    creates    => "/usr/local/revealcloud/revealcloud",
  }
}
