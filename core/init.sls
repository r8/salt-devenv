packages:
  pkg.installed:
    - pkgs:
      - vim
      - mc
      - git
      - php5-cli

locales:
  pkg.installed

fix_locale:
  cmd.run:
    - name: |
        locale-gen en_US.UTF-8
    - require:
      - pkg: locales

