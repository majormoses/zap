file '/tmp/cron' do
  content <<EOF
# Chef Name: a
* * * * * echo a

# Chef Name: b
* * * * * echo b

# Chef Name: c
* * * * * echo c
EOF
end

file '/tmp/empty' do
  content ''
end

execute 'crontab -u root /tmp/cron'
execute 'crontab -u nobody /tmp/cron'
execute 'crontab -u daemon /tmp/empty'

cron 'a' do
  action :nothing
end

cron 'b' do
  command 'echo b'
  user 'nobody'
end

cron 'c' do
  command 'echo c'
end

zap_crontab 'root'
zap_crontab 'nobody'
zap_crontab 'daemon'
