wine:
  pkg.installed

winetricks:
  pkg.installed:
    - require:
      - pkg: wine

