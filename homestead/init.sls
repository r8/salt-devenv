include:
  - vagrant
  - composer

homestead_install:
  cmd.run: 
    - name: |
        composer global require "laravel/homestead=~2.0"
        ~/.composer/vendor/bin/homestead init
    - user: r8
