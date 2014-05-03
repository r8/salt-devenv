/etc/apt/sources.list.d/webupd8team-sublime-text-3.list:
  file.managed:
    - source: salt://sublime-text/files/webupd8team-sublime-text-3.list
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
    - source: "salt://sublime-text/files/fonts/DejaVu Sans Mono Bold for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600

"/home/r8/.fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf":
  file.managed:
    - source: "salt://sublime-text/files/fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono Bold for Powerline.ttf"

"/home/r8/.fonts/DejaVu Sans Mono for Powerline.ttf":
  file.managed:
    - source: "salt://sublime-text/files/fonts/DejaVu Sans Mono for Powerline.ttf"
    - user: r8
    - group: r8
    - mode: 600
    - require:
      - file: "/home/r8/.fonts/DejaVu Sans Mono Bold Oblique for Powerline.ttf"

"/home/r8/.fonts/DejaVu Sans Mono Oblique for Powerline.ttf":
  file.managed:
    - source: "salt://sublime-text/files/fonts/DejaVu Sans Mono Oblique for Powerline.ttf"
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

/home/r8/.config/sublime-text-3:
  file.recurse:
    - source: salt://sublime-text/files/sublime-text-3
    - user: r8
    - group: r8

sublime_menuxml:
  file.replace:
    - name: /home/r8/.config/openbox/menu.xml
    - pattern: 'geany'
    - repl: 'subl'

sublime_menuxml_title:
  file.replace:
    - name: /home/r8/.config/openbox/menu.xml
    - pattern: 'Geany Text Editor'
    - repl: 'Sublime Text Editor'
    - require:
      - file: sublime_menuxml

sublime_rcxml:
  file.replace:
    - name: /home/r8/.config/openbox/rc.xml
    - pattern: 'geany'
    - repl: 'subl'
    - require:
      - file: sublime_menuxml

sublime_reconfigure_openbox:
  cmd.run:
    - name: killall -USR1 openbox
    - require:
      - file: sublime_rcxml

