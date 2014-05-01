skype: 
  cmd.run: 
    - name: |
        dpkg --add-architecture i386
        apt-get update
        wget -O /tmp/skype-install.deb http://www.skype.com/go/getskype-linux-deb
        dpkg -i /tmp/skype-install.deb
        apt-get -f install 
    - unless: dpkg -s skype 

