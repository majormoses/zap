`mkdir -p /etc/conf.d`

zap_directory '/etc/conf.d'

`touch /etc/conf.d/a`
`ln -nsf /etc/profile.d/.bashrc /etc/conf.d/b`

link '/etc/conf.d/link' do
  to '/etc/skel/.bash_logout'
  link_type :hard
end

link '/etc/conf.d/symlink' do
  to '/etc/skel/.bash_profile'
end

file '/etc/conf.d/file' do
  content <<EOF
export LANG=en_US
EOF
end

cookbook_file '/etc/conf.d/cookbook_file' do
  source 'file.txt'
end

template '/etc/conf.d/template' do
  source 'source.erb'
end
