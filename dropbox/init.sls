{% from 'map.jinja' import dist with context %}

{% if grains['os_family'] == 'Debian' %}
dropbox-pkg:
  pkgrepo.managed:
    - humanname: Dropbox
    - name: deb http://linux.dropbox.com/{{ dist.id }} {{ dist.codename }} main
    - dist: {{ dist.codename }}
    - comps: main
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: {{ dist.pkg_name }}

  pkg.latest:
    - name: {{ dist.pkg_name }}
    - refresh: True
{% elif dist_id == 'fedora' %}
dropbox-pkg:
  pkgrepo.managed:
    - humanname: Dropbox
    - baseurl: http://linux.dropbox.com/{{ dist.id }}/{{ dist.release }}
    - gpgcheck: 1
    - gpgkey: http://linux.dropbox.com/fedora/rpm-public-key.asc
    - require_in:
      - pkg: {{ dist.pkg_name }}

  pkg.latest:
    -name: {{ dist.pkg_name }}
    - refresh: True
{% endif %}
