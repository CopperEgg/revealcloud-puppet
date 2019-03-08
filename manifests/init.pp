# Class: copperegg
#
# Copyright 2012,2013 IDERA
#
# Sample Usage:
#
# include copperegg
#
# or to override any of the deafaults:
#
# class{'copperegg':  tags => 'tag1, tag2'}
#
class copperegg(
    String $tags = $copperegg::params::revealCloudTags,
    String $api_key = $copperegg::params::revealCloudAPIKey,
    String $label = $copperegg::params::revealCloudLabel,
    String $uuid = $copperegg::params::revealCloudUUID,
    String $oom_protect = $copperegg::params::revealCloudOomProtect,
    String $proxy =   $copperegg::params::revealCloudProxy,
    String $host = $copperegg::params::revealCloudHost
  ) inherits copperegg::params {

  include copperegg::params
  include copperegg::install

  service { $copperegg::params::revealCloudServiceName:
    ensure     => running,
 #   enable     => true,
    hasstatus => false,
    require => Class[ 'copperegg::install' ],
  }
}
