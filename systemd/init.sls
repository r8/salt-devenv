systemd:
  pkg.installed

systemd-sysv:
  pkg.installed:
    - require:
      - pkg: systemd

hold_systemd-sysv:
  cmd.run:
    - name: 'echo systemd-sysv hold | dpkg --set-selections'
    - require:
      - pkg: systemd-sysv

/etc/systemd/system/rc-local.service:
  file.managed:
    - source: salt://systemd/files/rc-local.service
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: systemd-sysv

enable_systemd_rc.local:
  cmd.run:
    - name: 'systemctl enable rc-local.service'
    - require:
      - file: /etc/systemd/system/rc-local.service 

