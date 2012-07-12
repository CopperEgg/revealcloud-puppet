class copperegg::install() {
  include copperegg::params
  
  exec { 'Install RevealCloud Collector':
    unless  => "/usr/bin/test -f /usr/local/revealcloud/revealcloud",
    path    => "/bin:/usr/bin:/usr/local/bin",
    cwd     => "/tmp/revealcloud",
    command => "/usr/bin/curl -s http://${copperegg::params::apikey}@api.copperegg.com/rc.sh | sh",
    creates => "/usr/local/revealcloud/revealcloud",

  }
  file { '/tmp/revealcloud' :
    ensure  => directory,
    mode    => 0755,
    require => Exec[ "Install RevealCloud Collector" ]
  }

#  service { "revealcloud":
#    name   => $service_name,    
#    ensure => running,
#    enable => true,
#  }   
}
