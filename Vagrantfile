# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	# All Vagrant configuration is done here. The most common configuration
	# options are documented and commented below. For a complete reference,
	# please see the online documentation at vagrantup.com.

	config.vm.hostname = "sra-vagrant-berkshelf"

	# Set the version of chef to install using the vagrant-omnibus plugin
	config.omnibus.chef_version = :latest

	# Every Vagrant virtual environment requires a box to build off of.
	# If this value is a shorthand to a box in Vagrant Cloud then 
	# config.vm.box_url doesn't need to be specified.
	config.vm.box = "chef/ubuntu-14.04"

	# The url from where the 'config.vm.box' box will be fetched if it
	# is not a Vagrant Cloud box and if it doesn't already exist on the 
	# user's system.
	# config.vm.box_url = "https://vagrantcloud.com/chef/ubuntu-14.04/version/1/provider/virtualbox.box"

	# Assign this VM to a host-only network IP, allowing you to access it
	# via the IP. Host-only networks can talk to the host machine as well as
	# any other machines on the same network, but cannot be accessed (through this
	# network interface) by any external networks.
	config.vm.network :private_network, type: "dhcp"

	# Create a forwarded port mapping which allows access to a specific port
	# within the machine from a port on the host machine. In the example below,
	# accessing "localhost:8080" will access port 80 on the guest machine.

	# Share an additional folder to the guest VM. The first argument is
	# the path on the host to the actual folder. The second argument is
	# the path on the guest to mount the folder. And the optional third
	# argument is a set of non-required options.
	# config.vm.synced_folder "../data", "/vagrant_data"

	# Provider-specific configuration so you can fine-tune various
	# backing providers for Vagrant. These expose provider-specific options.
	# Example for VirtualBox:
	#
	# config.vm.provider :virtualbox do |vb|
	#   # Don't boot with headless mode
	#   vb.gui = true
	#
	#   # Use VBoxManage to customize the VM. For example to change memory:
	#   vb.customize ["modifyvm", :id, "--memory", "1024"]
	# end
	#
	# View the documentation for the provider you're using for more
	# information on available options.

	# The path to the Berksfile to use with Vagrant Berkshelf
	# config.berkshelf.berksfile_path = "./Berksfile"

	# Enabling the Berkshelf plugin. To enable this globally, add this configuration
	# option to your ~/.vagrant.d/Vagrantfile file
	config.berkshelf.enabled = true

	# An array of symbols representing groups of cookbook described in the Vagrantfile
	# to exclusively install and copy to Vagrant's shelf.
	# config.berkshelf.only = []

	# An array of symbols representing groups of cookbook described in the Vagrantfile
	# to skip installing and copying to Vagrant's shelf.
	# config.berkshelf.except = []

	config.vm.provision :chef_solo do |chef|
		chef.json = {
			:vagrant => {
				:system_chef_solo => '/opt/chef/bin/chef-solo'
			},
			tmux: {
				version: "1.8",
				install_method: :source

			},
			devenvset: {
				owner: "vagrant",
				group: "vagrant",
				git: {
					username: "Cody Poll",
					email: "cjpoll@gmail.com",
					cache_credentials: "3600"
				}
			},
			vim: {
				version: "7-4-430"
			},
			rvm: {
				system_chef_solo: '/opt/chef/bin/chef-solo',
				user_rubies: [
					"2.0.0",
					"2.1.0",
				],
				user_global_gems: [
					{name: :bundler}
				],
				user_installs: [
					{ 
						user: :vagrant,
						default_ruby: '2.1.0',
						rubies: [
							'2.0.0',
							'2.1.0'
						]
					}
				],
			}
		}

		chef.run_list = [
			"recipe[build-essential]",
			"recipe[apt]",
			"recipe[git]",
			"recipe[tmux]",
			#"recipe[postgresql]",
			"recipe[rvm::user]",
			"recipe[devenvset]",
			"recipe[vim_chef::source]"
		]
	end
end
