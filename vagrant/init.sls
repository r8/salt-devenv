/etc/apt/sources.list.d/virtualbox.list:
  file.managed:
    - source: salt://vagrant/files/virtualbox.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: virtualbox-4.2 

virtualbox_key:
  cmd.run:
    - name: |
        wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
        apt-get update
    - unless: dpkg -s virtualbox-4.3 
    - require_in:
      - pkg: virtualbox-4.3

virtualbox-4.3:
  pkg.installed

vagrant:
  cmd.run:
    - name: |
        wget -O /tmp/vagrant.deb https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.4_x86_64.deb 
        dpkg -i /tmp/vagrant.deb
        apt-get -f install
    - unless: dpkg -s vagrant

