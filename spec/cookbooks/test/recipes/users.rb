`useradd larry &>/dev/null`

user 'moe'

`useradd curly &>/dev/null`

zap_users '/etc/passwd' do
  pattern	node['users']['pattern']
  filter do |u|
    u.uid >= 500
  end
end
