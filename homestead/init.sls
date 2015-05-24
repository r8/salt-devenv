include:
  - vagrant
  - composer

homestead_box:
  cmd.run: 
    - name: |
        vagrant box add --provider virtualbox laravel/homestead

homestead_install:
  cmd.run: 
    - name: |
        composer global require "laravel/homestead=~2.0"
