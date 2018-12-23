Vagrant.configure(2) do |config|

  config.vm.box = "bento/centos-7.2"
  config.vm.box_download_insecure = true
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
 
  # was app server 1 deployment mgr as well
 
  config.vm.define "node1" do |node1|
      node1.vm.network "private_network", ip: "192.168.33.70"
      node1.vm.hostname = "node1"
      node1.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2024"]
	    v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end

  # was app server 2   
   
  config.vm.define "node2" do |node2|
      node2.vm.network "private_network", ip: "192.168.33.71"
      node2.vm.hostname = "node2"
      node2.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2024"]
	    v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end

   # comms server

   config.vm.define "node3" do |node3|
      node3.vm.network "private_network", ip: "192.168.33.72"
      node3.vm.hostname = "node3"
      node3.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "512"]
            v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end

   # batch server

   config.vm.define "node4" do |node4|
      node4.vm.network "private_network", ip: "192.168.33.73"
      node4.vm.hostname = "node4"
      node4.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "512"]
            v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end

  # ihs server

  config.vm.define "node5" do |node5|
      node5.vm.network "private_network", ip: "192.168.33.74"
      node5.vm.hostname = "node5"
      node5.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "512"]
            v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end 

  # db2 server

  config.vm.define "node6" do |node6|
      node6.vm.network "private_network", ip: "192.168.33.75"
      node6.vm.hostname = "node6"
      node6.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "1024"]
            v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["storagectl", :id,"--name", "SATA Controller","--hostiocache", "on"]
      end
   end
end
