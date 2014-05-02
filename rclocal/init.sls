/etc/rc.local:
  file.managed:
    - source: salt://rclocal/files/rc.local
    - user: root
    - group: root
    - mode: 755 

/etc/rc.local.d:
    file.directory:
    - user: root
    - group: root
    - dir_mode: 755

