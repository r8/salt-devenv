/home/r8/Pictures/Wallpapers/Abduction.png:
  file.managed:
    - source: salt://appearance/files/Abduction.png
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 600

/home/r8/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml:
  file.replace:
    - pattern: '<property name="last-image" type="string" value="[^"]*"/>'
    - repl: '<property name="last-image" type="string" value="/home/r8/Pictures/Wallpapers/Abduction.png"/>'
    - require:
      - file: /home/r8/Pictures/Wallpapers/Abduction.png
