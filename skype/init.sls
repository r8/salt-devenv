skype: 
  cmd.run: 
    - name: |
        dpkg --add-architecture i386
        apt-get update
        wget -O /tmp/skype-install.deb http://www.skype.com/go/getskype-linux-deb
        dpkg -i /tmp/skype-install.deb
        apt-get -f install 
    - unless: dpkg -s skype 

skype-autostart:
  file.blockreplace:
    - name: /home/r8/.config/openbox/autostart 
    - marker_start: "# BLOCK TOP : salt managed zone : skype autostart"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : skype autostart"
    - content: |
        # Autostart skype
        (sleep 10s && skype) &
    - show_changes: True
    - append_if_not_found: True

