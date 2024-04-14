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

# Unicornが実行中であることを確認
describe command('ps aux | grep unicorn | grep -v grep') do
  its(:exit_status) { should eq 0 }
end
