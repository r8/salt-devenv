idea_download: 
  cmd.run: 
    - name: |
        wget -O /tmp/ideaIU.tar.gz http://download.jetbrains.com/idea/ideaIU-12.1.7b.tar.gz 
        tar xzf /tmp/ideaIU.tar.gz -C /opt
        ln -s /opt/idea-IU-129.1525/bin/idea.sh /usr/bin/idea.sh 
    - unless: test -d /opt/idea-IU-129.1525

