# lecture13_0329
terraform-ansible-circleci

ただのメモです
追加
bundlerのインストール
bundle install
bin/setup

- name: create rails.conf
  become_user: root
  template:
    src: roles/nginx/template/nginx.conf.j2
    dest: "/etc/nginx/conf.d/app.conf"
- rails.conf→app.conf

- config/environments/development.rb
- config.hosts記述追加

- rails s しないとpumaは立ち上がらない
- またpathが通らなくなってる？