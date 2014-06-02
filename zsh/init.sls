zsh:
  pkg.installed

oh-my-zsh:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/r8/.oh-my-zsh
    - user: r8
    - submodules: True
    - require:
      - pkg: zsh

oh-my-zsh-root:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /root/.oh-my-zsh
    - user: root
    - submodules: True
    - require:
      - pkg: zsh

/root/.zshrc:
  file.copy:
    - source: /root/.oh-my-zsh/templates/zshrc.zsh-template
    - require:
        - git: oh-my-zsh-root

/home/r8/.zshrc:
  file.copy:
    - source: /home/r8/.oh-my-zsh/templates/zshrc.zsh-template
    - require:
        - git: oh-my-zsh 

chsh-zsh-root:
  cmd.run:
    - name: 'chsh -s /bin/zsh root'
    - require:
      - pkg: zsh

chsh-zsh:
  cmd.run:
    - name: 'chsh -s /bin/zsh r8'
    - require:
      - pkg: zsh

