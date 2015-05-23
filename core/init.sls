packages:
  pkg.installed:
    - pkgs:
      - vim
      - mc
      - git
      - php5-cli
      - meld
      - nfs-kernel-server
      - nfs-common

locales:
  pkg.installed

fix_locale:
  cmd.run:
    - name: |
        locale-gen en_US.UTF-8
    - require:
      - pkg: locales

