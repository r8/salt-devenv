dev-packages:
  pkg.installed:
    - pkgs:
      - git
      - php5-cli 

/etc/apt/sources.list.d/webupd8team-sublime-text-3.list:
  file.managed:
    - source: salt://dev/files/webupd8team-sublime-text-3.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: sublime-text-installer

sublime-text_key:
  cmd.run:
    - name: |
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 
        apt-get update
    - unless: dpkg -s sublime-text-installer
    - require_in:
      - pkg: sublime-text-installer

sublime-text-installer:
  pkg.installed

"/home/r8/.fonts/DejaVu Sans Mono Bold for Powerline.ttf":
  file.managed:
    - source: "salt://dev/files/fonts/DejaVu Sans Mono Bold for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600

"/home/r8/.fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf":
  file.managed:
    - source: "salt://dev/files/fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono Bold for Powerline.ttf"

"/home/r8/.fonts/DejaVu Sans Mono for Powerline.ttf":
  file.managed:
    - source: "salt://dev/files/fonts/DejaVu Sans Mono for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf"

"/home/r8/.fonts/DejaVu Sans Mono Oblique for Powerline.ttf":
  file.managed:
    - source: "salt://dev/files/fonts/DejaVu Sans Mono Oblique for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono for Powerline.ttf"

dev_fonts:
  cmd.run:
    - name: "fc-cache -vf /home/r8/.fonts" 
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono Oblique for Powerline.ttf"

