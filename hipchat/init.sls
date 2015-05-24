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

/home/r8/.config/autostart/hipchat.desktop:
  file.managed:
    - source: salt://hipchat/files/hipchat.desktop
    - makedirs: True
    - user: r8
    - group: r8 
    - mode: 600

