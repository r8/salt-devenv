idea_download: 
  cmd.run: 
    - name: |
        rm -f /usr/bin/idea.sh /tmp/ideaIU.tar.gz
        wget -O /tmp/ideaIU.tar.gz http://download.jetbrains.com/idea/ideaIU-2016.1.3.tar.gz
        tar xzf /tmp/ideaIU.tar.gz -C /opt
        ln -s /opt/idea-IU-145.1617.8/bin/idea.sh /usr/bin/idea.sh
    - unless: test -d /opt/idea-IU-145.1617.8
