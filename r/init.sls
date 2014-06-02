/etc/apt/sources.list.d/r.list:
  file.managed:
    - source: salt://r/files/r.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: r-base

r_key:
  cmd.run:
    - name: |
        apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
        apt-get update
    - unless: dpkg -s r-base 
    - require_in:
      - pkg: r-base

r-base:
  pkg.installed

