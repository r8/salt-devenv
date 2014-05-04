ruby_packages:
  pkg.installed:
    - pkgs:
      - ruby1.9.3
      - rubygems

ruby-switch:
  pkg.installed

ruby_switch:
  cmd.run:
    - name: "ruby-switch --set ruby1.9.1"
    - require:
      - pkg: ruby-switch

bundler:
  gem.installed

