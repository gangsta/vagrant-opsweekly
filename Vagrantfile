Vagrant.configure(2) do |config|

  config.vm.hostname = "opsweekly"
  config.vm.box = "vStone/centos-6.x-puppet.3.x"

  config.vm.synced_folder 'hieradata', '/etc/puppet/hiera'
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file = "site.pp"
    puppet.options = "--verbose --debug"
    puppet.hiera_config_path = "hiera.yaml"
  end

  config.ssh.insert_key = false

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.network :private_network, ip: "192.168.22.10"

end
