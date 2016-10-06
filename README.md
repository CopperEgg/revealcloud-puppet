Uptime Cloud Monitor Puppet Module
=
Copyright 2016 IDERA

This Puppet module can be used to

* Install the Uptime Cloud Monitor collector on your puppet nodes.
* Configure probes for your puppet nodes.

Note
==
The latest version is not yet released to puppet forge. You can use the [tarball method](https://ask.puppet.com/question/4463/how-can-i-install-a-module-from-local-tarball-puppet-module-method-will-not-work/) to use the latest version.
Installation
==

1. Create an account on Uptime Cloud Monitor [here](https://www.idera.com/infrastructure-monitoring-as-a-service/freetrialsubscriptionform) if you don't have one.
2. You can obtain and install this module from Puppet Forge: `puppet module install CopperEgg-copperegg`.
   Alternatively, clone this Github package, and copy the release tarball to your puppet master.
   Then install the release package as follows: 'puppet module install /path-to-tarball/CopperEgg-copperegg-<VERSION>.tar.gz'.
3. Include the `copperegg` class to nodes that you want to monitor in your site.pp file (example below).
4. Login to Uptime Cloud Monitor and you should see your systems being monitored in some time.

Configuring Uptime Cloud Monitor Collector (Server monitoring)
==
    node default {
      class { 'copperegg':
        api_key => 'YOUR_API_KEY',
        label => 'SERVER_LABEL[optional]',
        tags => 'tag1, tag2[optional]'
      }
    }


Configuring Uptime Cloud Monitor probes
===

To create a RevealUptime probe use the `revealuptime_probe` resource:

    revealuptime_probe { "http://www.example.com":
      ensure      => present,
      description => "This is a test probe.",
      apikey      => 'YOUR_API_KEY_HERE',
    }

Similarly use `revealuptime_probe` resource with `ensure` as `absent` to delete the probe:

    revealuptime_probe { "http://www.example.com":
      ensure  => absent,
      description => "This is a test probe.",
      apikey  => 'YOUR_API_KEY_HERE',
    }

Contributors
==

Brett Maton
James Turnbull

