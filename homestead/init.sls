include:
  - vagrant
  - composer

homestead_install:
  cmd.run: 
    - name: |
        composer global require "laravel/homestead=~2.0"
        /home/r8/.composer/vendor/bin/homestead init
    - user: r8
    - unless: test -f /home/r8/.homestead/Homestead.yaml

/home/r8/.homestead/Homestead.yaml:
  file.replace:
    - pattern: 'ip: "192\.168\.10\.10"'
    - repl: 'ip: "192.168.33.10"'
    - require:
      - cmd.homestead_install
