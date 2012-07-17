# Class: copperegg
#
# Copyright 2012, CopperEgg
#
class copperegg() {
  include copperegg::params, copperegg::install

  service { $copperegg::params::revealCloudServiceName:
    ensure     => running,
    enable     => true,
    require => Class[ 'copperegg::install' ],
  }
}
