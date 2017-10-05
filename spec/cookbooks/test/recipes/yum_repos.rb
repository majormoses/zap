`mkdir /etc/yum.repos.d`
`touch /etc/yum.repos.d/a.repo`

yum_repository 'chef-stable' do
  description 'Chef Software Inc stable channel'
  baseurl "https://packages.chef.io/stable-yum/el/#{node['platform_version'].split('.').first}/$basearch"
  make_cache false
  skip_if_unavailable true
end

include_recipe 'zap::yum_repos_d'
