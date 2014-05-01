compositor-restart:
  file.blockreplace:
    - name: /home/r8/.config/openbox/autostart
    - marker_start: "# BLOCK TOP : salt managed zone : compositor restart"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : compositor restart"
    - content: |
        (cb-compositor --restart) & 
    - show_changes: True
    - append_if_not_found: True 

