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
    environment => "RC_TAG='${copperegg::params::revealCloudTags}'",
    command     => "/usr/bin/curl -s http://${copperegg::params::revealCloudAPIKey}@api.copperegg.com/rc.sh | sh",
    creates     => "/usr/local/revealcloud/revealcloud",

  }

}
