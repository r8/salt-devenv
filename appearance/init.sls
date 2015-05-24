/home/r8/Pictures/Wallpapers/Abduction.png:
  file.managed:
    - source: salt://appearance/files/Abduction.png
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 600

set-wallpaper:
  cmd.run:
    - name: "dbus-launch gsettings set org.gnome.desktop.background picture-uri 'file:///home/r8/Pictures/Wallpapers/Abduction.png'"
    - user: r8
    - require:
      - file: /home/r8/Pictures/Wallpapers/Abduction.png 

set-theme:
  cmd.run:
    - name: "dbus-launch gsettings set org.gnome.desktop.interface gtk-theme 'Radiance'"
    - user: r8

