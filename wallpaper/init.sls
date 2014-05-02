/home/r8/images/wallpapers/Abduction.png:
  file.managed:
    - source: salt://wallpaper/files/Abduction.png
    - user: r8
    - group: r8
    - mode: 600

set-wallpaper:
  cmd.run:
    - name: "nitrogen --set-tiled /home/r8/images/wallpapers/Abduction.png"
    - user: r8
    - require:
      - file: /home/r8/images/wallpapers/Abduction.png 

