require 'spec_helper'

listen_port = 80

# Nginxがインストールされているかを確認
describe package('nginx') do
  it { should be_installed }
end

# Nginxが稼働中であることを確認
describe service('nginx') do
  it { should be_running }
end

# pumaが実行中であることを確認
describe command('ps aux | grep puma') do
  its(:exit_status) { should eq 0 }
end

# アプリケーションがデータベースと正しくやり取りできることを確認
describe command('DB_PASSWORD=$DB_PASSWORD rails db:test:prepare') do
  its(:exit_status) { should eq 0 }
end

# ポート80がリスニング状態であることを確認
describe port(listen_port) do
  it { should be_listening }
end
