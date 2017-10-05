`groupadd input -g 999 &>/dev/null`
`groupadd larry &> /dev/null`

group 'moe'

`groupadd curly &> /dev/null`

group 'input' do
  action :nothing
end

zap_groups '/etc/group' do
  pattern	node['groups']['pattern']
  filter do |g|
    g.gid >= 500
  end
end
