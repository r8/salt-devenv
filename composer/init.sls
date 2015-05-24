include:
  - php

composer_install: 
  cmd.run: 
    - name: |
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer
    - unless: test -f /usr/local/bin/composer
