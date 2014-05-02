dev-packages:
  pkg.installed:
    - pkgs:
      - git
      - php5-cli 

/etc/apt/sources.list.d/webupd8team-sublime-text-3.list:
  file.managed:
    - source: salt://dev/files/webupd8team-sublime-text-3.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: sublime-text-installer

sublime-text_key:
  cmd.run:
    - name: |
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 
        apt-get update
    - unless: dpkg -s sublime-text-installer
    - require_in:
      - pkg: sublime-text-installer

sublime-text-installer:
  pkg.installed

