/etc/apt/sources.list.d/webupd8team-java.list:
  file.managed:
    - source: salt://java/files/webupd8team-java.list
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkg: oracle-java8-installer

java_key:
  cmd.run:
    - name: |
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
        apt-get update
    - require_in:
      - pkg: oracle-java8-installer

java_accept_license:
  cmd.run:
    - name: echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    - require_in:
      - pkg: oracle-java8-installer

oracle-java8-installer:
  pkg.installed:
    - require_in:
      - pkg: remove_openjdk

remove_openjdk:
  pkg.removed:
    - pkgs:
      - openjdk-6-jre
      - openjdk-6-jre-headless
      - openjdk-6-jre-lib

