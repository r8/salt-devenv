/home/r8/Pictures/Wallpapers/Abduction.png:
  file.managed:
    - source: salt://appearance/files/Abduction.png
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 600

appearance_wallpaper:
  cmd.run:
    - name: |
        xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --create -t string --set /home/r8/Pictures/Wallpapers/Abduction.png
        xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorLVDS1/workspace0/last-image --create -t string --set /home/r8/Pictures/Wallpapers/Abduction.png
    - user: r8
    - cwd: /home/r8
    - require:
      - file: /home/r8/Pictures/Wallpapers/Abduction.png 
