include:
  - autostart

/home/r8/Pictures/Wallpapers/Abduction.png:
  file.managed:
    - source: salt://appearance/files/Abduction.png
    - makedirs: True
    - user: r8
    - group: r8
    - mode: 600

appearance_setup:
  file.blockreplace:
    - name: /home/r8/.config/autostart.sh
    - marker_start: "# BLOCK TOP : salt managed zone : appearance"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : appearance"
    - content: |
        xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --create -t string --set /home/r8/Pictures/Wallpapers/Abduction.png
        xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorLVDS1/workspace0/last-image --create -t string --set /home/r8/Pictures/Wallpapers/Abduction.png
    - show_changes: True
    - append_if_not_found: True
    - require:
      - file: /home/r8/Pictures/Wallpapers/Abduction.png
