phpstorm_download: 
  cmd.run: 
    - name: |
        wget -O /tmp/PhpStorm.tar.gz http://download.jetbrains.com/webide/PhpStorm-7.1.3.tar.gz
        tar xzf /tmp/PhpStorm.tar.gz -C /opt
        ln -s /opt/PhpStorm-133.982/bin/phpstorm.sh /usr/bin/phpstorm.sh 
    - unless: test -d /opt/PhpStorm-133.982

