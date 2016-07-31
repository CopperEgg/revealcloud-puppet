# !/bin/bash

# echo "Puppet version is $(puppet --version)"
if [ $( puppet --version) != "3.4.1" ]; then
  echo "Updating puppet"
  apt-get install --yes lsb-release
  DISTRIB_CODENAME=$(lsb_release --codename --short)
  DEB="puppetlabs-release-${DISTRIB_CODENAME}.deb"
  DEB_PROVIDES="/etc/apt/sources.list.d/puppetlabs.list"

  if [ ! -e $DEB_PROVIDES ]
  then
      wget -q http://apt.puppetlabs.com/$DEB
      sudo dpkg -i $DEB
  fi
  sudo apt-get update
  sudo apt-get install -o Dpkg::Options::="--force-confold" --force-yes -y puppet
else
  echo "Puppet is up to date!"
fi

# echo "Running puppet"
puppet apply /etc/puppet/manifests/init.pp