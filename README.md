copperegg - CopperEgg collector
=

Copyright 2012,2013 IDERA

This Puppet module will install the Uptime Cloud Monitor collector on your servers.

It also contains a simple type and provider for installing and managing RevealUptime Probes.

Installation
==

1. Sign up for an account at https://copperegg.com/revealcloud-free-signup/.
2. You can obtain and install this module from Puppet Forge: 'puppet module install CopperEgg-copperegg'.
   Alternatively, clone this Github package, and copy the release tarball to your puppet master.
   Then install the release package as follows: 'puppet module install /path-to-tarball/CopperEgg-copperegg-1.0.3.tar.gz'.
3. Include the `copperegg` class to nodes that you want to monitor, e.g., in your site.pp file.
4. Login to Uptime Cloud Monitor and you should see your systems being monitored within 20-30 seconds.

RevealUptime
==
    node default {
      class { 'copperegg':
        api_key => 'YOUR_API_KEY',
        label => 'SERVER_LABEL[obtional]',
        tags => 'tag1, tag2[optional]'
      }
    }


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

