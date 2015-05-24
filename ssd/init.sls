/etc/fstab:
  file.replace:
    - pattern: 'errors=remount-ro '
    - repl: 'errors=remount-ro,noatime '

tmpfs:
  file.blockreplace:
    - name: /etc/fstab
    - marker_start: "# BLOCK TOP : salt managed zone : tmpfs"
    - marker_end: "# BLOCK BOTTOM : salt managed zone : tmpfs"
    - content: |
        tmpfs   /tmp       tmpfs   defaults,noatime,mode=1777   0  0
        tmpfs   /var/log   tmpfs   defaults,noatime,mode=0755   0  0
        tmpfs   /var/spool tmpfs   defaults,noatime,mode=1777   0  0
        tmpfs   /var/tmp   tmpfs   defaults,noatime,mode=1777   0  0
    - show_changes: True
    - append_if_not_found: True

/etc/grub.d/10_linux:
  file.replace:
    - pattern: 'root=\$\{linux_root_device_thisversion\} ro \$\{args\}'
    - repl: 'root=${linux_root_device_thisversion} ro elevator=deadline ${args}'

update_grub:
  cmd.run:
    - name: 'update-grub'
    - require:
      - file: /etc/grub.d/10_linux

/etc/cron.daily/fstrim:
  file.managed:
    - source: salt://ssd/files/fstrim
    - user: root
    - group: root
    - mode: 755

