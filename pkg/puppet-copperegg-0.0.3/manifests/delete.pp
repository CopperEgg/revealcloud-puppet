# Class: copperegg::delete
#
# This manifest deletes CopperEgg collectors
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
class copperegg::delete {

  file { '/etc/init.d/revealcloud':
    ensure => absent;
  }

  file { '/usr/local/revealcloud/':
    ensure => absent,
  }

  service { 'revealcloud':
    ensure  => stopped,
    enable  => false,
  }
}
