/home/r8/images/wallpapers/Abduction.png:
  file.managed:
    - source: salt://wallpaper/files/Abduction.png
    - user: r8
    - group: r8
    - mode: 600

/home/r8/.config/nitrogen/bg-saved.cfg:
  file.managed:
    - source: salt://wallpaper/files/bg-saved.cfg
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: /home/r8/images/wallpapers/Abduction.png 

reconfigure_openbox:
  cmd.run:
    - name: "killall -USR1 openbox"
    - require:
      - file: /home/r8/.config/nitrogen/bg-saved.cfg

