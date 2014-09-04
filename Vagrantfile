# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	# Ubuntu 12.04, 64 bit
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Providers
  config.vm.provider :virtualbox do |p|
    p.customize ['modifyvm', :id, '--memory', '512', '--ioapic', 'on']
  end

  # SSH
  config.ssh.username = "vagrant"

  # Port Forwarding
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 28015, host: 28015
  config.vm.network :forwarded_port, guest: 29015, host: 29015

  # Attempt to 'guess' the default network
  config.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'

  # Provisioning
  config.vm.provision :shell do |sh|
    sh.inline = <<-EOF
      export DEBIAN_FRONTEND=noninteractive;
      apt-get update --assume-yes;
      apt-get install --assume-yes python-software-properties;
      add-apt-repository --yes ppa:rethinkdb/ppa 2>&1;
      apt-get update --assume-yes;
      apt-get install --assume-yes rethinkdb;

      sed -e 's/somebody/root/g' -e 's/somegroup/root/g' -e 's/# bind=127.0.0.1/bind=all/g' /etc/rethinkdb/default.conf.sample > /etc/rethinkdb/instances.d/default.conf

      rethinkdb create -d /var/lib/rethinkdb/instances.d/default 2>&1;

      service rethinkdb start;
    EOF
  end
end
