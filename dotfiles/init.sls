include:
  - zsh

dotfiles:
  git.latest:
    - name: https://github.com/r8/dotfiles.git
    - target: /home/r8/.dotfiles
    - user: r8
    - submodules: True
    - require:
      - pkg: zsh

deploy_dotfiles:
  cmd.run:
    - name: 'bash /home/r8/.dotfiles/deploy.sh'
    - cwd: /home/r8/.dotfiles
    - user: r8
    - require:
      - git: dotfiles

