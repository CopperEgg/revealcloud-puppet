puppet-copperegg - CopperEgg collector 
==========================================

This puppet module will install CopperEgg's collector on your servers.

Installation
------------

1. Sign up for an account at https://copperegg.com/revealcloud-free-signup/.
2. Clone this Github package. Copy the release tarball to your puppet master ... puppet-copperegg/pkg/puppet-copperegg-x.y.z.tar.gz.
3. Install the release package as follows: 'puppet module install /path-to-tarball/puppet-copperegg-x.y.z.tar.gz'   
3. Apply the `copperegg` class to any systems (nodes) that you want to monitor, e.g., in your site.pp file : `class { 'copperegg': apikey => 'your apikey here' }`
4. Login to CopperEgg and you should see your systems being monitored within 20-30 seconds.
