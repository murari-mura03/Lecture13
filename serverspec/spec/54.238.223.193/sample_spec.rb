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

# ポート80がリスニング状態であることを確認
describe port(listen_port) do
  it { should be_listening }
end

# ローカルホストのポート80に対するHTTPリクエストが成功している（HTTPステータスコード200）ことを確認
describe command('curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /^200$/ }
end