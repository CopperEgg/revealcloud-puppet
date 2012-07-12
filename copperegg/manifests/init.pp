class copperegg() {
  include copperegg::params, copperegg::install
  service { $copperegg::params::revealCloudServiceName:
#    ensure     => running,
#    hasstatus  => true,
#    hasrestart => true,
#    enable     => true,
    require => Class[ 'copperegg::install' ],
  }
}
