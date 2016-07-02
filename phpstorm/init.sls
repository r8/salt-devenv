phpstorm_download: 
  cmd.run: 
    - name: |
        rm -f /usr/bin/phpstorm.sh /tmp/PhpStorm.tar.gz
        wget -O /tmp/PhpStorm.tar.gz http://download.jetbrains.com/webide/PhpStorm-2016.1.2.tar.gz
        tar xzf /tmp/PhpStorm.tar.gz -C /opt
        ln -s /opt/PhpStorm-145.1616.3/bin/phpstorm.sh /usr/bin/phpstorm.sh
    - unless: test -d /opt/PhpStorm-145.1616.3
