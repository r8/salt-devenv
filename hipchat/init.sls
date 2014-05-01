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
    - require_in:
      - pkg: hipchat

hipchat:
  pkg.installed

