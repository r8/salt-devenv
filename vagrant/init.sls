virtualbox:
  pkg.installed

vagrant:
  cmd.run:
    - name: |
        wget --local-encoding=UTF-8 -O /tmp/vagrant.deb https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
        dpkg -i /tmp/vagrant.deb
        apt-get -f install
    - unless: dpkg-query --show vagrant | grep 1.7.2 

vagrant_vbguest_plugin:
  cmd.run:
    - name: "vagrant plugin install vagrant-vbguest"
    - user: r8

