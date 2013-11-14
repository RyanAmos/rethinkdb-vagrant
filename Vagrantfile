Vagrant::Config.run do |config|
	# Ubuntu 12.04, 64 bit
	config.vm.box     = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"

	# changing nictype partially helps with Vagrant issue #516, VirtualBox NAT interface chokes when
	# of slow outgoing connections is large (in dozens or more).
	# see https://github.com/mitchellh/vagrant/issues/912 regarding: --rtcuseutc
	config.vm.customize ["modifyvm", :id, "--nictype1", "Am79C973", "--memory", "512", "--ioapic", "on", "--rtcuseutc", "on"]

	config.ssh.username = "vagrant"
	config.vm.network :bridged
	config.vm.forward_port 8080, 8080
	config.vm.forward_port 28015, 28015

	config.vm.provision :shell do |sh|
		sh.inline = <<-EOF
			export DEBIAN_FRONTEND=noninteractive;
			apt-get update --assume-yes;
			apt-get install --assume-yes python-software-properties;
			add-apt-repository --yes ppa:rethinkdb/ppa 2>&1;
			apt-get update --assume-yes;
			apt-get install --assume-yes rethinkdb;

			sed -e 's/somebody/root/g' -e 's/somegroup/root/g' /etc/rethinkdb/default.conf.sample > /etc/rethinkdb/instances.d/default.conf
			echo 'bind=all' >> /etc/rethinkdb/instances.d/default.conf

			rethinkdb create -d /var/lib/rethinkdb/instances.d/default 2>&1;

			service rethinkdb start;
		EOF
	end

end
