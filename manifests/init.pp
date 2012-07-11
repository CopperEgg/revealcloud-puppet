class copperegg($apikey = $::copperegg_apikey) {
  include copperegg::params
 
 group { "revealcloud":
        ensure => present,
        gid => 999
  }
    
  user { "revealcloud":
     ensure      => present,
     gid         => "revealcloud",
     groups 	 => ["adm", "sys"],
     home        => "/home/revealcloud",
     shell       => "/bin/bash",
     managehome  => true,
     membership  => minimum,
     require => Group['revealcloud'],
  }
  
  exec { "download-revealcloud-collector":
    path        => "/bin:/usr/bin:/usr/local/bin",
    cwd         => "/home/revealcloud",
    command     => "/usr/bin/curl -s http://${apikey}@api.copperegg.com/rc.sh | sh",
    creates => "/usr/local/revealcloud/revealcloud",
    before => Service['revealcloud'],
    require => User['revealcloud'],
  }
  
  service { "revealcloud":
	name      => $service_name,    
	ensure    => running,
    enable    => true,
    require => User['revealcloud'],
  }   
}
