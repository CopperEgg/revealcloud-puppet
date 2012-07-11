class copperegg($apikey = $::copperegg_apikey) {
  include copperegg::params
  
  exec { "download-revealcloud-collector":
    path        => "/bin:/usr/bin:/usr/local/bin",
    cwd         => "/home/revealcloud",
    command     => "/usr/bin/curl -s http://${apikey}@api.copperegg.com/rc.sh | sh",
    creates => "/usr/local/revealcloud/revealcloud",
    before => Service['revealcloud'],
  }
  
  service { "revealcloud":
	name      => $service_name,    
	ensure    => running,
    enable    => true,
  }   
}
