# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure a minimum Vagrant version to prevent potential issues.
Vagrant.require_version '>= 1.5.0'

# Configure using Vagrant's version 2 API/syntax.
Vagrant.configure(2) do |config|
  # Ubuntu 14.04, 64 bit
  config.vm.box         = 'ubuntu/trusty64'
  config.vm.box_version = '~> 14.04'

  # Providers
  config.vm.provider :virtualbox do |p|
    p.customize ['modifyvm', :id, '--memory', '512', '--ioapic', 'on']
  end

  # SSH
  config.ssh.username = 'vagrant'

  # Port Forwarding
  config.vm.network :forwarded_port, guest: 8080,  host: 8080
  config.vm.network :forwarded_port, guest: 28015, host: 28015
  config.vm.network :forwarded_port, guest: 29015, host: 29015

  # Attempt to 'guess' the default network
  config.vm.network :public_network, bridge: 'en0: Wi-Fi (AirPort)'

  # Provisioning
  config.vm.provision :shell do |sh|
    sh.inline = <<-EOF
      export DEBIAN_FRONTEND=noninteractive;

      # Add RethinkDB Source
      apt-key adv --fetch-keys http://download.rethinkdb.com/apt/pubkey.gpg 2>&1;
      echo "deb http://download.rethinkdb.com/apt $(lsb_release -sc) main" > /etc/apt/sources.list.d/rethinkdb.list;
      apt-get update --assume-yes;

      # RethinkDB Install & Setup
      apt-get install --assume-yes rethinkdb;
      sed -e 's/# bind=127.0.0.1/bind=all/g' /etc/rethinkdb/default.conf.sample > /etc/rethinkdb/instances.d/default.conf;
      rethinkdb create -d /var/lib/rethinkdb/instances.d/default 2>&1;
      service rethinkdb start;
    EOF
  end
end
