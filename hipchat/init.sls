/etc/apt/sources.list.d/atlassian-hipchat.list:
  file.managed:
    - source: salt://hipchat/files/atlassian-hipchat.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: hipchat

hipchat_key:
  cmd.run:
    - name: |
        wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
        apt-get update
    - unless: dpkg -s hipchat 
    - require_in:
      - pkg: hipchat

hipchat:
  pkg.installed

hipchat-autostart:
  file.blockreplace:
    - name: /home/r8/.config/openbox/autostart
    - marker_start: "# BLOCK TOP : salt managed zone : hipchat autostart"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : hipchat autostart"
    - content: |
        # Autostart hipchat
        (sleep 25s && hipchat) &
    - show_changes: True
    - append_if_not_found: True 

