include:
  - vagrant
  - composer

homestead_box:
  cmd.run: 
    - name: |
        vagrant box add laravel/homestead

homestead_install:
  cmd.run: 
    - name: |
        composer global require "laravel/homestead=~2.0"
