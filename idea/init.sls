idea_download: 
  cmd.run: 
    - name: |
        rm -f /usr/bin/idea.sh /tmp/ideaIU.tar.gz
        wget -O /tmp/ideaIU.tar.gz https://d1opms6zj7jotq.cloudfront.net/idea/ideaIU-14.1.3.tar.gz
        tar xzf /tmp/ideaIU.tar.gz -C /opt
        ln -s /opt/idea-IU-141.1010.3/bin/idea.sh /usr/bin/idea.sh
    - unless: test -d /opt/idea-IU-141.1010.3
