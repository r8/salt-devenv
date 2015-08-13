phpstorm_download: 
  cmd.run: 
    - name: |
        rm -f /usr/bin/phpstorm.sh /tmp/PhpStorm.tar.gz
        wget -O /tmp/PhpStorm.tar.gz http://download-cf.jetbrains.com/webide/PhpStorm-9.0.1.tar.gz 
        tar xzf /tmp/PhpStorm.tar.gz -C /opt
        ln -s /opt/PhpStorm-141.2402/bin/phpstorm.sh /usr/bin/phpstorm.sh
    - unless: test -d /opt/PhpStorm-141.2402
