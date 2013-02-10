copperegg - CopperEgg collector
=

Copyright 2012,2013 CopperEgg Corporation

This Puppet module will install the CopperEgg collector on your servers.

It also contains a simple type and provider for installing and managing RevealUptime Probes.

Installation
==

1. Sign up for an account at https://copperegg.com/revealcloud-free-signup/.
2. You can obtain and install this module from Puppet Forge: 'puppet module install CopperEgg-copperegg'.
   Alternatively, clone this Github package, and copy the release tarball to your puppet master.
   Then install the release package as follows: 'puppet module install /path-to-tarball/CopperEgg-copperegg-1.0.3.tar.gz'.
3. Include the `copperegg` class to nodes that you want to monitor, e.g., in your site.pp file.
4. Login to CopperEgg and you should see your systems being monitored within 20-30 seconds.

Recent Changes
==

1.0.3 Released on February 10,2013
  - Fixed a parameter-passing regression in 1.0.2. The issue manifested itself when certain of the parameters specified in params.pp were empty strings.
    Now the Tags, Label, Proxy and UUID will function as expected.
  - Also in this release, I have begun including the release tarball (e.g., CopperEgg-copperegg-1.0.3.tar.gz).

RevealUptime
==

Creating a probe
===

To create a RevealUptime probe use the `revealuptime_probe` resource:

    revealuptime_probe { "http://www.example.com":
      ensure      => present,
      description => "This is a test probe.",
      apikey      => 'abcdef123456',
    }

Removing a probe
===

    revealuptime_probe { "http://www.example.com":
      ensure  => absent,
      description => "This is a test probe.",
      apikey  => 'abcdef123456',
    }

Contributors
==

Brett Maton
James Turnbull

