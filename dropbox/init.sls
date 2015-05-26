dropbox-pkg:
  pkgrepo.managed:
    - humanname: Dropbox
    - name: deb http://linux.dropbox.com/ubuntu vivid main
    - dist: vivid
    - comps: main
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: dropbox

  pkg.latest:
    - name: dropbox
    - refresh: True
