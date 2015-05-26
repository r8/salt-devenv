tor_pkg:
  pkgrepo.managed:
    - humanname: Tor Browser
    - name: deb http://deb.torproject.org/torproject.org vivid main
    - dist: vivid
    - comps: main
    - keyid: 886DDD89
    - keyserver: keys.gnupg.net
    - require_in:
      - pkg: tor

  pkg.latest:
    - name: tor
    - refresh: True

tor-browser:
  pkg.latest:
    - name: tor-browser
    - refresh: True
    - require:
      - pkg: tor
