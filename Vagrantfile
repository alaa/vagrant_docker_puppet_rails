Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.has_ssh = true
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "./puppet/manifests"
    puppet.module_path   = "./puppet/modules"
    puppet.manifest_file  = "default.pp"

  end

  config.ssh.username = 'root'
  config.ssh.private_key_path = "/root/.ssh/id_rsa"
  config.ssh.port = 22
end
