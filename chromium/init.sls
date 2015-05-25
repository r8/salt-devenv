chromium_packages:
  pkg.installed:
    - pkgs:
      - chromium-browser
      - pepperflashplugin-nonfree

chromium_set_default:
  cmd.run:
    - name: |
        update-alternatives --set x-www-browser /usr/bin/chromium-browser
        update-alternatives --set gnome-www-browser /usr/bin/chromium-browser
    - require:
      - pkg: chromium_packages
