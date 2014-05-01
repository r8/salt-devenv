keyboard-switch:
  file.blockreplace:
    - name: /home/r8/.config/openbox/autostart
    - marker_start: "# BLOCK TOP : salt managed zone : keyboard switch"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : keyboard switch"
    - content: |
        setxkbmap -layout "us,ru,ua" -option "grp:caps_toggle" &
        fbxkb &
    - show_changes: True
    - append_if_not_found: True 

