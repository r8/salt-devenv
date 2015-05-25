/home/r8/.config/autostart.sh:
  file.managed:
    - source: salt://autostart/autostart.sh
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 755

/home/r8/.config/autostart/autostart.desktop:
  file.managed:
    - source: salt://autostart/files/autostart.desktop
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 600
